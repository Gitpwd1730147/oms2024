package com.tzb.oms.mapper;

import com.tzb.oms.entity.Test;
import com.tzb.oms.page.TestExcel;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/13
 */
public interface TestMapper {
    void saveTest(List<Test> testList);

    public List<Test> selectAllTestByExcel();
}