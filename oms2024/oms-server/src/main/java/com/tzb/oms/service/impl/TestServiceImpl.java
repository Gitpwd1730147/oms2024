package com.tzb.oms.service.impl;

import com.tzb.oms.entity.Test;
import com.tzb.oms.mapper.TestMapper;
import com.tzb.oms.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/20
 */
@Service
public class TestServiceImpl implements TestService {
    @Autowired
    private TestMapper testMapper;
    @Override
    public void saveTest(List<Test> testList, Integer hh) {
        testList.forEach(test -> {
            test.setAddr(test.getTelephone());
            test.setShipmentId(hh);
        });
        testMapper.saveTest(testList);
    }
}
