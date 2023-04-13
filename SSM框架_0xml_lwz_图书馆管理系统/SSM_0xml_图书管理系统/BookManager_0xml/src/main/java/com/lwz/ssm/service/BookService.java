package com.lwz.ssm.service;

import com.lwz.ssm.entity.Book;
import com.github.pagehelper.PageInfo;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
//RootConfig配置完@EnableTransactionManagement后在此处启用事务
//aop: 和 tx:
@Transactional
public interface BookService {
    @Transactional(readOnly = true)
    PageInfo<Book> findAllBooks(int pageNum);

    int saveBook(Book book);

    int delBookById(int id);
    @Transactional(readOnly = true)
    Book findBookById(int id);

    int updateBook(Book book);

    String selectPhotoById(int id);
}
