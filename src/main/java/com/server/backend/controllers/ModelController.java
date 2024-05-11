package com.server.backend.controllers;

import com.server.backend.dto.ColorDTO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@RestController
@RequestMapping("/api/getColor")
@CrossOrigin
public class ModelController {

    @Value("${url.model.classification}")
    private String classificationURL;

    @PostMapping(value = "/")
    public ResponseEntity<?> getColor(@RequestBody ColorDTO colorDTO) {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.MULTIPART_FORM_DATA);

        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("color", colorDTO);
        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, httpHeaders);
        ResponseEntity<Map> response = restTemplate.postForEntity(classificationURL + "/color_detect", requestEntity, Map.class);
        return ResponseEntity.ok(response.getBody());
    }

}
