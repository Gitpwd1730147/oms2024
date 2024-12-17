package com.tzb.oms.service.impl;

import com.tzb.oms.entity.Factory;
import com.tzb.oms.mapper.FactoryMapper;
import com.tzb.oms.service.FactoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
@Service
public class FactoryServiceImpl implements FactoryService {

    //注入FactoryMapper
    @Autowired
    private FactoryMapper factoryMapper;

    //获取工厂信息列表
    @Override
    public List<Factory> queryAllFactory() {
        return factoryMapper.selectAllFactory();
    }

    //新增工厂
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int addFactory(Factory factory) {
        return factoryMapper.insertFactory(factory);
    }

    //修改
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int editFactoryById(Factory factory) {
        return factoryMapper.updateFactory(factory);
    }

    //删除
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int removeFactory(Integer factoryId) {
        return factoryMapper.deleteFactoryById(factoryId);
    }
}
