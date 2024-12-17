package com.tzb.oms.service.impl;

import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.StyleSize;
import com.tzb.oms.mapper.StyleSizeMapper;
import com.tzb.oms.service.StyleSizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/27
 */
@Service
public class StyleSizeServiceImpl implements StyleSizeService {

    //注入
    @Autowired
    private StyleSizeMapper styleSizeMapper;

    //新增
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int saveStyleSize(StyleSize styleSize) {
        return styleSizeMapper.insertStyleSize(styleSize);
    }

    //获得款号尺寸配比
    @Override
    public List<StyleSize> queryStyleSizeByStyleId(Integer styleId) {
        return styleSizeMapper.selectStyleSizeByStyleId(styleId);
    }

    //修改款号尺寸配比
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result modifyStyleSize(StyleSize styleSize) {
        //修改尺码配比
        int i = styleSizeMapper.updateStyleSize(styleSize);
        //响应
        if (i > 0) {
            return Result.ok("修改成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
    }

    //删除款号尺寸配比
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result removeStyleSize(Integer styleSizeId) {
        //删除尺码配比
        int i = styleSizeMapper.deleteStyleSize(styleSizeId);
        //响应
        if (i > 0) {
            return Result.ok("删除成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
    }


}
