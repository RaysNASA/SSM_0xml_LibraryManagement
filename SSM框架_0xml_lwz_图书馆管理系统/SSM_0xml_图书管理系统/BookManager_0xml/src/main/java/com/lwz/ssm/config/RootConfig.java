package com.lwz.ssm.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.github.pagehelper.PageInterceptor;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

//配置类 并启动组件扫描
@Configuration
@ComponentScan("com.lwz.ssm")
//启动事务管理
@EnableTransactionManagement
//resource 中*mapper.xml的扫描类，只不过删除了*mapper.xml后继承到mapper文件夹下面的注解里，利用此注解扫描
@MapperScan("com.lwz.ssm.mapper")

//指明数据库配置位置
@PropertySource("classpath:datasource.properties")
public class RootConfig {

    @Autowired
    Environment env;

    //数据源   别人写的类你要用就要加注解@Bean
    @Bean
    public DataSource dataSource(){
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUsername(env.getProperty("spring.datasource.username"));
        dataSource.setPassword(env.getProperty("spring.datasource.password"));
        dataSource.setUrl(env.getProperty("spring.datasource.url"));
        return dataSource;
    }

    //事务管理器  别人写的类你要用就要加注解@Bean
    @Bean
    public TransactionManager transactionManager(){
        DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager(dataSource());
        return dataSourceTransactionManager;
    }

    //MyBatis  SqlSessionFactoryBean PageInterceptor  别人写的类你要用就要加注解@Bean
    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryBean(){
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        sqlSessionFactoryBean.setPlugins(new PageInterceptor());
        return sqlSessionFactoryBean;
    }

    //  别人写的类你要用就要加注解@Bean
    @Bean
    public SqlSessionTemplate sqlSessionTemplate() throws Exception {
        SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactoryBean().getObject());
        return sqlSessionTemplate;
    }

}
