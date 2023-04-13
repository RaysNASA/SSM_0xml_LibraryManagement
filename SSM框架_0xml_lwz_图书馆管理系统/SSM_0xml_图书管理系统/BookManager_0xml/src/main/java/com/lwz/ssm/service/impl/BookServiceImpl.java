package com.lwz.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lwz.ssm.entity.Book;
import com.lwz.ssm.mapper.BookMapper;
import com.lwz.ssm.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService {
    private BookMapper bookMapper;

    @Autowired
    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    public PageInfo<Book> findAllBooks(int pageNum) {
        PageHelper.startPage(pageNum,2);
        PageInfo<Book> pageInfo = new PageInfo<Book>(bookMapper.findAll());
        return pageInfo;
    }

    @Override
    public int saveBook(Book book) {
        return bookMapper.save(book);
    }

    @Override
    public int delBookById(int id) {

        return bookMapper.del(id);
    }

    @Override
    public Book findBookById(int id) {

        return bookMapper.findById(id);
    }

    @Override
    public int updateBook(Book book) {
        return bookMapper.updateBook(book);
    }

    @Override
    public String selectPhotoById(int id) {
        return bookMapper.selectPhotoById(id);
    }
}
