package com.tzb.oms.service;

import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.StyleColor;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/24
 */
public interface StyleColorService {
    //新增款号颜色配比
    public int saveStyleColor(StyleColor styleColor);

    //根据款号id获取颜色配比表
    public List<StyleColor> queryStyleColorByStyleId(Integer styleId);

    //根据ID删除颜色配比
    public Result removeStyleColorMatching(Integer styleColorId);

    //根据ID修改颜色配比信息
    public Result modifyStyleColorMatching(StyleColor styleColor);
}
