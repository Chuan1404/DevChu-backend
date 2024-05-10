package com.server.backend.utils;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

@Component
public class Pagination {
    public Pageable page(String page, String limit, String sortBy) {
        Pageable pageable = null;
        Sort sort = null;
        if (limit == null)
            limit = "30";

        if (page == null || Integer.parseInt(page) < 1)
            page = "1";

        if(sortBy == null) {
            sortBy = "id";
        }

        try {
            pageable = PageRequest.of(Integer.parseInt(page) - 1, Integer.parseInt(limit), Sort.by(sortBy).ascending());
            return pageable;
        } catch (NumberFormatException numberFormatException) {
            return null;
        }
    }
}
