package com.lwz.ssm.config;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.*;

public class MyWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{RootConfig.class};
    }
    //告诉哪个是servlet配置类
    @Override
    protected Class<?>[] getServletConfigClasses() {
        //等同于 AnnotationConfigWebApplicationContext ac = new AnnotationConfigWebApplicationContext(WebConfig.class);
        return new Class[]{WebConfig.class};
    }
    //模拟迎宾
    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }


    //实现文件上传
    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {

        // Optionally also set maxFileSize, maxRequestSize, fileSizeThreshold
        registration.setMultipartConfig(new MultipartConfigElement(""));
    }

    //实现 filter
    @Override
    protected Filter[] getServletFilters() {
        return new Filter[]{
                new CharacterEncodingFilter("utf-8")
        };
    }

}
