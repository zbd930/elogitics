package com.duogesi.service;

import com.duogesi.entities.company.supplier_company;
import com.duogesi.mapper.CompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Xinxiservice {

    @Autowired
    private CompanyMapper companyMapper;

    //获取供应商
    public List<supplier_company> get_byid(int user_id){
       return companyMapper.select_address_byid(user_id);
    }
//更改数据
    public int update_company(supplier_company supplier_company){
        return companyMapper.update_company(supplier_company);
    }
}
