package com.tzb.oms.service.impl;

import com.tzb.oms.entity.PackingBox;
import com.tzb.oms.entity.Result;
import com.tzb.oms.mapper.PackingBoxMapper;
import com.tzb.oms.service.PackingBoxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/23
 */
@Service
public class PackingBoxServiceImpl implements PackingBoxService {

    //注入PackingBoxMapper
    @Autowired
    private PackingBoxMapper packingBoxMapper;


    @Override
    public List<PackingBox> queryAllPackingBox() {

        return packingBoxMapper.selectAllPackingBox();
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result addPackingBox(PackingBox packingBox) {
        int i = packingBoxMapper.insertPackingBox(packingBox);
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"添加失败");
        }
        return Result.ok("添加成功");
    }

    //根据packingBoxId修改包装箱信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result editPackingBox(PackingBox packingBox) {
        //执行业务
        int i = packingBoxMapper.updatePackingBox(packingBox);
        //响应
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
        }
        return Result.ok("修改成功");
    }

    //根据id删除包装箱信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result removePackingBox(Integer packingBoxId) {
        //执行业务
        int i = packingBoxMapper.deletePackingBoxById(packingBoxId);
        //响应
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
        }
        return Result.ok("删除成功");
    }
}
