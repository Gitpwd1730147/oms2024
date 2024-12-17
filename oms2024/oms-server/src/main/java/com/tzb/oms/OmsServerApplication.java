package com.tzb.oms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

//开启redis注解版缓存
@EnableCaching
@MapperScan(basePackages = {"com.tzb.oms.mapper", "com.tzb.oms.utils","com.tzb.oms.page"})
@SpringBootApplication
public class OmsServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(OmsServerApplication.class, args);
    }

}
