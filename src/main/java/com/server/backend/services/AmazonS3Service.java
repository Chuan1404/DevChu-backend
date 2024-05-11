package com.server.backend.services;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.Map;

import com.amazonaws.services.s3.model.*;
import com.server.backend.enums.FileQuality;
import com.server.backend.models.FileUploaded;
import com.server.backend.repositories.FileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.util.IOUtils;

import javax.imageio.ImageIO;

@Service
public class AmazonS3Service {
    @Value("${aws.s3.bucket.public.name}")
    private String publicBucket;

    @Value("${aws.s3.bucket.private.name}")
    private String privateBucket;

    @Value("${url.model.copy_right}")
    private String copyRightURL;

    @Autowired
    private AmazonS3 amazonS3;

    public S3Object getS3Object(FileUploaded fileUploaded) {
        String objectKey = fileUploaded.getRoot().split(".com/")[1]; // Replace with your actual object key
        GetObjectRequest getObjectRequest = new GetObjectRequest(privateBucket, objectKey);
        S3Object s3object = amazonS3.getObject(getObjectRequest);

        return s3object;
    }

    public String uploadFile(File file, FileQuality quality) {
        // sign here
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.MULTIPART_FORM_DATA);

        FileSystemResource fileSystemResource = new FileSystemResource(file);

        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("file", fileSystemResource);

        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, httpHeaders);
        ResponseEntity<byte[]> response = restTemplate.postForEntity(copyRightURL + "/hide_signature", requestEntity, byte[].class);
        byte[] imageData = response.getBody();

        String filePath = file.getName(); // Path where you want to save the file

        try {
            System.out.println(filePath);
            FileOutputStream fos = new FileOutputStream(filePath);
            fos.write(imageData);
            file.delete();
            fos.close();
        } catch (IOException e) {
            System.err.println("Error writing file: " + e.getMessage());
            file.delete();
            return null;
        }
        
        String currentBucket = quality != FileQuality.ROOT ? publicBucket : privateBucket;
        // bucket/type/folder/file
        String path = String.format("images/%s/%s", quality.name().toLowerCase(), filePath);

        PutObjectRequest putObjectRequest = new PutObjectRequest(currentBucket, path, file);
        PutObjectResult result = amazonS3.putObject(putObjectRequest);
        URL s3Url = amazonS3.getUrl(currentBucket, path);
        file.delete();

        return s3Url.toString();
    }

    public byte[] downloadFile(FileUploaded fileUploaded) {
        // bucket/type/folder/file
        S3Object s3Object = amazonS3.getObject(privateBucket, fileUploaded.getRoot().split(".com/")[1]);
        S3ObjectInputStream inputStream = s3Object.getObjectContent();
        try {
            byte[] content = IOUtils.toByteArray(inputStream);
            return content;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    public void deleteFile(FileUploaded fileUploaded) {
        for (S3ObjectSummary file : amazonS3.listObjects(privateBucket, fileUploaded.getRoot().split(".com/")[1]).getObjectSummaries()){
            amazonS3.deleteObject(privateBucket, file.getKey());
        }
        for (S3ObjectSummary file : amazonS3.listObjects(publicBucket, fileUploaded.getDisplay().split(".com/")[1]).getObjectSummaries()){
            amazonS3.deleteObject(publicBucket, file.getKey());
        }
        for (S3ObjectSummary file : amazonS3.listObjects(publicBucket, fileUploaded.getMedium().split(".com/")[1]).getObjectSummaries()){
            amazonS3.deleteObject(publicBucket, file.getKey());
        }
        for (S3ObjectSummary file : amazonS3.listObjects(publicBucket, fileUploaded.getHigh().split(".com/")[1]).getObjectSummaries()){
            amazonS3.deleteObject(publicBucket, file.getKey());
        }
    }
}
