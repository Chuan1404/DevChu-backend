package com.server.backend.dto;

import com.server.backend.models.FileTag;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FileTagDTO {
    private String name;
    private double probs;

    public FileTagDTO(FileTag fileTag) {
        this.name = fileTag.getTag().getName();
        this.probs = fileTag.getProbs();
    }
}
