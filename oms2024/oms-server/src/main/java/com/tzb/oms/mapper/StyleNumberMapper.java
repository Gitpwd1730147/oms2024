package com.tzb.oms.mapper;

import com.tzb.oms.entity.StyleNumber;
import com.tzb.oms.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/17
 */
public interface StyleNumberMapper {

    /**
     * 添加款号
     * @param styleNumber
     * @return
     */
    public int insertStyleNumber(StyleNumber styleNumber);

    /**
     * 查询款号总行数
     * @param styleNumber
     * @return
     */
    public int selectStyleNumberCount(StyleNumber styleNumber);

    /**
     * 根据id查询款号信息
     * @param styleId
     * @return
     */
    public StyleNumber selectStyleNumberById(Integer styleId);

    /**
     * 分页查询款号
     * @param page
     * @param styleNumber
     * @return
     */
    public List<StyleNumber> selectStyleNumberPage(@Param("page") Page page,@Param("styleNumber") StyleNumber styleNumber);

    /**
     * 根据ID修改款号
     * @param styleNumber
     * @return
     */
    public int updateStyleNumber(StyleNumber styleNumber);

    /**
     * 根据款号ID删除款号信息
     * @param styleId
     * @return
     */
    public int deleteStyleNumber(Integer styleId);

    /**
     * 根据ID修改款号颜色配比图
     * @param styleNumber
     * @return
     */
    public int updateStyleColorImg(StyleNumber styleNumber);

    /**
     * 根据款号id列表获得款号信息列表
     * @param page
     * @param styleIdList
     * @return
     */
    public List<StyleNumber> selectStyleNumberByStyleIdListForPage(@Param("page") Page page,@Param("styleIdList") List<Integer> styleIdList);
}