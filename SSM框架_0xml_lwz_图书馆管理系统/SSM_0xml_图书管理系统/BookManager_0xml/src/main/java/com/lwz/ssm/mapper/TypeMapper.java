package com.lwz.ssm.mapper;

import com.lwz.ssm.entity.Type;
import org.apache.ibatis.annotations.*;

import java.util.List;
@Mapper
public interface TypeMapper {
    @Select("select * from t_type where id=#{tid}")
    Type findById(int id);

    @Select("select * from t_type")
    List<Type> findAll();
}
