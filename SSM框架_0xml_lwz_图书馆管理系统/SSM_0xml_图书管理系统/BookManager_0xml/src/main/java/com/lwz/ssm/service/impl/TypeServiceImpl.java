package com.lwz.ssm.service.impl;

import com.lwz.ssm.entity.Type;
import com.lwz.ssm.mapper.TypeMapper;
import com.lwz.ssm.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    private TypeMapper typeMapper;

    @Autowired
    public void setTypeMapper(TypeMapper typeMapper) {
        this.typeMapper = typeMapper;
    }

    @Override
    public List<Type> findAllTypes() {
        return typeMapper.findAll();
    }
}

