package com.tzb.oms.mapper;

import com.tzb.oms.entity.Mark;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
public interface MarkMapper {

    /**
     * 查询所有唛头
     * @return
     */
    public List<Mark> selectAllMark();

    /**
     * 新增唛头
     * @param mark
     * @return
     */
    public int insertMark(Mark mark);

    /**
     * 根据id编辑唛头
     * @param mark
     * @return
     */
    public int updateMarkById(Mark mark);

    /**
     * 根据id删除唛头
     * @param markId
     * @return
     */
    public int deleteMarkById(Integer markId);
}