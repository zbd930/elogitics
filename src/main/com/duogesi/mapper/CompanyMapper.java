package com.duogesi.mapper;

import com.duogesi.entities.company.supplier_company;

import java.util.List;

public interface CompanyMapper {

    List<supplier_company> select_address_byid(int user_id);
    int update_company(supplier_company supplier_company);
}
