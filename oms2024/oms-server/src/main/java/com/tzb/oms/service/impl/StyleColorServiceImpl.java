package com.tzb.oms.service.impl;

import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.StyleColor;
import com.tzb.oms.mapper.StyleColorMapper;
import com.tzb.oms.service.StyleColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/24
 */
@Service
public class StyleColorServiceImpl implements StyleColorService {

    //注入StyleColorMapper
    @Autowired
    private StyleColorMapper styleColorMapper;


    //新增款号颜色
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int saveStyleColor(StyleColor styleColor) {
        return styleColorMapper.insertStyleColor(styleColor);
    }

    //获得颜色配比列表
    @Override
    public List<StyleColor> queryStyleColorByStyleId(Integer styleId) {
        return styleColorMapper.selectStyleColorByStyleId(styleId);
    }

    //删除颜色配比信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result removeStyleColorMatching(Integer styleColorId) {
        //根据ID删除颜色配比
        int i = styleColorMapper.deleteStyleColorMatching(styleColorId);
        if (i > 0) {
            return Result.ok("删除成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
    }

    //修改颜色配比
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result modifyStyleColorMatching(StyleColor styleColor) {
        //根据ID修改颜色配比
        int i = styleColorMapper.updateStyleColorMatching(styleColor);

        if (i > 0) {
            return Result.ok("修改成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
    }



}
