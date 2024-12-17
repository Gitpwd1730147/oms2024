package com.tzb.oms.mapper;

import com.tzb.oms.entity.StyleColor;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/17
 */
public interface StyleColorMapper {

    /**
     * 新增颜色配比
     * @param styleColor
     * @return
     */
    public int insertStyleColor(StyleColor styleColor);

    /**
     * 根据款号id获取颜色配比表
     * @param styleId
     * @return
     */
    public List<StyleColor> selectStyleColorByStyleId(Integer styleId);

    /**
     * 根据ID删除颜色配比
     * @param styleColorId
     * @return
     */
    public int deleteStyleColorMatching(Integer styleColorId);

    /**
     * 根据ID修改颜色配比信息
     * @param styleColor
     * @return
     */
    public int updateStyleColorMatching(StyleColor styleColor);

    /**
     * 根据款号Id删除相关的颜色配比信息
     * @param styleId
     * @return
     */
    public int deleteStyleColorMatchingByStyleId(Integer styleId);
}