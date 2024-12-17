package com.tzb.oms.service;

import com.tzb.oms.entity.PackingBox;
import com.tzb.oms.entity.Result;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/23
 */
public interface PackingBoxService {
    //获取包装箱列表
    public List<PackingBox> queryAllPackingBox();

    //添加包装箱信息
    public Result addPackingBox(PackingBox packingBox);

    //根据packingBoxId修改包装箱信息
    public Result editPackingBox(PackingBox packingBox);

    //根据packingBoxId删除包装箱信息
    public Result removePackingBox(Integer packingBoxId);
}
