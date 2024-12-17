package com.tzb.oms.service;

import com.tzb.oms.entity.Mark;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
public interface MarkService {
    //查询所有唛头
    public List<Mark> queryAllMark();

    //新增唛头
    public int saveMakr(Mark mark);

    //编辑唛头
    public int modifyMark(Mark mark);

    //删除唛头
    public int removeMark(Integer markId);
}
