package com.tzb.oms.service;

import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.StyleSize;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/27
 */
public interface StyleSizeService {

    //新增尺码配比
    public int saveStyleSize(StyleSize styleSize);

    //根据款号ID获得响应的尺码配比列表
    public List<StyleSize> queryStyleSizeByStyleId(Integer styleId);

    //根据ID修改尺码配比信息
    public Result modifyStyleSize(StyleSize styleSize);

    //根据id删除尺码配比
    public Result removeStyleSize(Integer styleSizeId);
}
