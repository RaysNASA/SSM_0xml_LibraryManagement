package com.lwz.ssm.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.Date;

@Data
public class Book {
    private int id;
    @NotEmpty(message = "{book.name.required}")
    @Size(min = 3,max = 20,message = "{book.name.size}")
    private String name;
    @NotEmpty(message = "{book.author.required}")
    private String author;
    private int tid;
    private Double price;
    private String descri;
    //MultipartFile 赋值给 String 发生错误
    private String photo;
    //类型转换失败会报400错误
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pubdate;
    private Type type;

}
