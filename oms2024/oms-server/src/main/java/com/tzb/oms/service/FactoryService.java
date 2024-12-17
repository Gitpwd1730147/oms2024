package com.tzb.oms.service;

import com.tzb.oms.entity.Factory;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
public interface FactoryService {

    //获取工厂列表
    public List<Factory> queryAllFactory();

    //新增工厂
    public int addFactory(Factory factory);

    //根据id修改工厂
    public int editFactoryById(Factory factory);

    //根据ID删除工厂信息
    public int removeFactory(Integer factoryId);
}
