package com.server.backend.controllers.admin;

import com.server.backend.dto.FileUploadedDTO;
import com.server.backend.dto.response.ErrorResponse;
import com.server.backend.services.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("admin/api/file")
@CrossOrigin
public class AdminFileController {

    @Autowired
    private FileService fileService;

    @GetMapping(value = "/")
    public ResponseEntity<?> index(@RequestParam Map<String, String> params) {
        Page<FileUploadedDTO> pages = fileService.getFiles(params, true);
        if (pages == null) {
            return ResponseEntity.badRequest().body(new ErrorResponse("Parameter are not valid"));
        }
        return ResponseEntity.ok(pages);
    }

    @PostMapping(value = "/extract")
    public ResponseEntity<?> extract(@RequestParam(name = "file") MultipartFile multipartFile) {
        ResponseEntity<?> response = fileService.extractFile(multipartFile);
        return response;
    }
}
