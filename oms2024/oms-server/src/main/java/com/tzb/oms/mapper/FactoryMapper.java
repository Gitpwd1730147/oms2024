package com.tzb.oms.mapper;

import com.tzb.oms.entity.Factory;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
public interface FactoryMapper {

    /**
     * 获取工厂信息列表
     * @return
     */
    public List<Factory> selectAllFactory();

    /**
     * 新增工厂信息
     * @param factory
     * @return
     */
    public int insertFactory(Factory factory);

    /**
     * 根据id修改工厂信息
     * @param factory
     * @return
     */
    public int updateFactory(Factory factory);

    /**
     * 根据ID删除工厂信息
     * @param factoryId
     * @return
     */
    public int deleteFactoryById(Integer factoryId);
}