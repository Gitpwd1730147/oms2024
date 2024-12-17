package com.tzb.oms.service.impl;

import com.tzb.oms.entity.Mark;
import com.tzb.oms.mapper.MarkMapper;
import com.tzb.oms.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
@Service
public class MarkServiceImpl implements MarkService {

    //注入MarkMapper
    @Autowired
    private MarkMapper markMapper;
    @Override
    public List<Mark> queryAllMark() {
        return markMapper.selectAllMark();
    }

    //新增唛头
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int saveMakr(Mark mark) {
        return markMapper.insertMark(mark);
    }

    //修改唛头
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int modifyMark(Mark mark) {
        return markMapper.updateMarkById(mark);
    }

    //删除唛头
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int removeMark(Integer markId) {
        return markMapper.deleteMarkById(markId);
    }
}
