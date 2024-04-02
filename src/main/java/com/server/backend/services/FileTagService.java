package com.server.backend.services;

import com.server.backend.models.FileTag;
import com.server.backend.models.FileUploaded;
import com.server.backend.models.Tag;
import com.server.backend.repositories.FileTagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class FileTagService {

    @Autowired
    private FileTagRepository fileTagRepository;

    @Autowired TagService tagService;

    public Page<FileTag> findAll(Specification<FileTag> spec, Pageable pageable) {
        return  fileTagRepository.findAll(spec, pageable);
    }

    public Set<FileTag> saveAll(FileUploaded fileUploaded, String tagStr, String probStr) {
        ArrayList<String> tagArr = (ArrayList<String>) Arrays.stream(tagStr.split(",")).collect(Collectors.toList());
        ArrayList<String> probArr = (ArrayList<String>) Arrays.stream(probStr.split(",")).collect(Collectors.toList());

        Set<FileTag> fileTags = new HashSet<>();

        for(int i = 0; i < probArr.size(); i++) {
            double d = Double.parseDouble(probArr.get(i));

            FileTag fileTag = new FileTag();

            fileTag.setFile(fileUploaded);
            fileTag.setTag(tagService.findByName(tagArr.get(i)));
            fileTag.setProbs(d);

            fileTags.add(fileTag);
            fileTagRepository.save(fileTag);
        }
        return fileTags;
    }

}
