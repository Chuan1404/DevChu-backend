package com.server.backend.repositories.specification;

import com.server.backend.enums.FileType;
import com.server.backend.models.FileTag;
import com.server.backend.models.FileUploaded;
import com.server.backend.models.Tag;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class FileTagSpecification {
    public Specification<FileTag> activeFiles() {
        return (root, query, criteriaBuilder) -> {
            Join<FileTag, FileUploaded> fileJoin = root.join("file");
            return criteriaBuilder.isTrue(fileJoin.get("isActive"));
        };
    }

    public Specification<FileTag> fileTags(List<String> keywords) {
        return (root, query, criteriaBuilder) -> {
            Join<FileTag, Tag> fileJoin = root.join("tag");
            Predicate[] predicates = keywords.stream()
                    .map(keyword -> criteriaBuilder.like(fileJoin.get("name"), "%" + keyword + "%"))
                    .toArray(Predicate[]::new);
            Predicate finalPredicate = criteriaBuilder.or(predicates);
            return finalPredicate;
        };
    }

    public Specification<FileTag> fromPrice(double price) {
        return (root, query, criteriaBuilder) -> {
            Join<FileTag, FileUploaded> fileJoin = root.join("file");
            return criteriaBuilder.greaterThanOrEqualTo(fileJoin.get("price"), price);
        };
    }

    public Specification<FileTag> toPrice(double price) {
        return (root, query, criteriaBuilder) -> {
            Join<FileTag, FileUploaded> fileJoin = root.join("file");
            return criteriaBuilder.lessThanOrEqualTo(fileJoin.get("price"), price);
        };
    }

    public Specification<FileTag> fileType(List<String> types) {
        return (root, query, criteriaBuilder) -> {
            Join<FileTag, FileUploaded> fileJoin = root.join("file");
            return fileJoin.get("type").in(types.stream().map(item -> FileType.valueOf(item)).collect(Collectors.toSet()));
        };
    };
}
