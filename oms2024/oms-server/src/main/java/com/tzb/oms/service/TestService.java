package com.tzb.oms.service;

import com.tzb.oms.entity.Test;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/18
 */
public interface TestService {

    public void saveTest(List<Test> testList,Integer hh);

}
