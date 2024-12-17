package com.tzb.oms.mapper;

import com.tzb.oms.entity.StyleSize;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/17
 */
public interface StyleSizeMapper {

    /**
     * 新增尺码配比
     * @param styleSize
     * @return
     */
    public int insertStyleSize(StyleSize styleSize);

    /**
     * 根据款号ID获得响应的尺码配比列表
     * @param styleId
     * @return
     */
    public List<StyleSize> selectStyleSizeByStyleId(Integer styleId);

    /**
     * 根据ID修改尺码配比信息
     * @param styleSize
     * @return
     */
    public int updateStyleSize(StyleSize styleSize);

    /**
     * 根据id删除尺码配比
     * @param styleSizeId
     * @return
     */
    public int deleteStyleSize(Integer styleSizeId);

    /**
     * 根据款号Id删除响应的尺码配比信息
     * @param styleId
     * @return
     */
    public int deleteStyleSizeByStyleId(Integer styleId);
}