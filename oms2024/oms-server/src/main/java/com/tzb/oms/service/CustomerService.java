package com.tzb.oms.service;

import com.tzb.oms.entity.Customer;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
public interface CustomerService {

    //添加客户
    public int saveCustomer(Customer customer);

    //获取客户信息列表
    public List<Customer> queryAllCustomer();

    //根据客户id修改客户信息
    public int editCustomer(Customer customer);

    //根据id删除客户信息
    public int removeCustomer(Integer customerId);
}
