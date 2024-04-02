package com.server.backend.repositories;

import com.server.backend.models.FileTag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface FileTagRepository extends JpaRepository<FileTag, Integer>, JpaSpecificationExecutor<FileTag> {
    Page<FileTag> findAll(Pageable pageable);
}
