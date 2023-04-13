package com.lwz.ssm.mapper;

import com.lwz.ssm.entity.Book;
import org.apache.ibatis.annotations.*;

import java.util.List;
@Mapper
public interface BookMapper {

    //通过查找mybatis官方文档可知对应的xml标签对应怎样的注解
    @Results(
            value = {
                    @Result(column = "tid",property = "type",one = @One(select = "com.lwz.ssm.mapper.TypeMapper.findById"))
            }
    )
    @Select("select * from t_book")
    List<Book> findAll();
    @Insert("insert into t_book values (default,#{name},#{author},#{tid},#{price},#{descri},#{photo},#{pubdate})")
    int save(Book book);
    @Delete("delete from t_book where id=#{id}")
    int del(int id);
    @Select("select * from t_book where id=#{id}")
    Book findById(int id);
    @Update("update t_book set name=#{name},author=#{author},tid=#{tid},price=#{price},descri=#{descri},photo=#{photo},pubdate=#{pubdate} where id=#{id}")
    int updateBook(Book book);
    @Select("select photo from t_book where id=#{id}")
    String selectPhotoById(int id);
}
