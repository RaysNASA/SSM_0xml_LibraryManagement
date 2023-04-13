package com.lwz.ssm.controller;

import com.lwz.ssm.entity.Book;
import com.lwz.ssm.service.BookService;
import com.lwz.ssm.service.TypeService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/book")
public class BookController {

    private BookService bookService;

    private TypeService typeService;

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }
    @Autowired
    public void setTypeService(TypeService typeService) {
        this.typeService = typeService;
    }

    @RequestMapping("/list")
    public String list(Model model, @RequestParam(required = false, defaultValue = "1") int pageNum) {
        PageInfo<Book> pageInfo = bookService.findAllBooks(pageNum);
        model.addAttribute("pageInfo", pageInfo);
        return "bookList"; //07:24
    }

    /*
    这里的book是是用来接收添加失败时的回填数值的
    */
    @GetMapping("/add")
    public String toAdd(Book book, Model model) {
        model.addAttribute("types", typeService.findAllTypes());
        return "bookAdd";
    }

    //BindingResult可以避免400的错误
    @PostMapping("/add")
    public String doAdd(MultipartFile photox, HttpServletRequest request, @Valid Book book, BindingResult result, Model model) throws IOException {
        if (result.hasErrors()) {
            model.addAttribute("types", typeService.findAllTypes());
            return "bookAdd";
            //有错后回到原始界面需要回填正确的数据
        }
        //没有文件时也能执行而不是返回错误，增强了代码的健壮性
        if (!photox.isEmpty()) {
            String ext = photox.getOriginalFilename().substring(photox.getOriginalFilename().lastIndexOf("."));
            String newFile = UUID.randomUUID() + ext;
            photox.transferTo(new File(request.getServletContext().getRealPath("/static/upload/") + newFile));
            book.setPhoto(newFile);
            //System.out.println(book);
        }
        int ret = bookService.saveBook(book);
        return "redirect:/book/list";//课程3>19:54>500错误因为com.lwz.ssm中的lwz写成了zpf
    }
//    @RequestMapping("/del")
//    public String del(int id){
//        int ret = bookService.delBookById(id);
//        return "redirect:/book/list";
//    }

    @RequestMapping("/del")
    public String del(int id,HttpServletRequest request){
        String photoName = bookService.selectPhotoById(id);

        String url = new File(request.getServletContext().getRealPath("/static/upload")) + "\\" + photoName;
        System.out.println(url);
        File photoFile = new File(url);
        if (photoFile.exists()){
            photoFile.delete();
            System.out.println("服务器图片删除成功");
        }else{
            System.out.println("服务器图片删除失败");
        }
        int ret = bookService.delBookById(id);
        return "redirect:/book/list";
    }

    @RequestMapping("/toEdit")
    public String toEdit(int id,Model model){
        Book book = bookService.findBookById(id);
        model.addAttribute("book",book);
        model.addAttribute("types",typeService.findAllTypes());
        return "bookEdit";
    }

    @RequestMapping("/doEdit")
    public String doEdit(MultipartFile photox, HttpServletRequest request, @Valid Book book, BindingResult result, Model model) throws IOException {
        if (result.hasErrors()) {
            model.addAttribute("types", typeService.findAllTypes());
            return "bookEdit";
            //有错后回到原始界面需要回填正确的数据
        }
        //没有文件时也能执行而不是返回错误，增强了代码的健壮性
        if (!photox.isEmpty()) {
            String ext = photox.getOriginalFilename().substring(photox.getOriginalFilename().lastIndexOf("."));
            String newFile = UUID.randomUUID() + ext;
            photox.transferTo(new File(request.getServletContext().getRealPath("/static/upload/") + newFile));
            book.setPhoto(newFile);

            //        System.out.println(book);
        }
//        System.out.println(book+"=====================================================");
        int ret = bookService.updateBook(book);
        return "redirect:/book/list";
    }


}
