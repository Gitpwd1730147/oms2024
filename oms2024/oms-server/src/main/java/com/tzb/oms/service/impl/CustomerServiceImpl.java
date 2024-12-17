package com.tzb.oms.service.impl;

import com.tzb.oms.entity.Customer;
import com.tzb.oms.mapper.CustomerMapper;
import com.tzb.oms.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    //注入CustomerMapper
    @Autowired
    private CustomerMapper customerMapper;

    //新增客户
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int saveCustomer(Customer customer) {
        return customerMapper.addCustomer(customer);
    }

    //获取客户列表
    @Override
    public List<Customer> queryAllCustomer() {
        return customerMapper.selectAllCustomer();
    }

    //根据客户id修改客户信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int editCustomer(Customer customer) {
        return customerMapper.updateCustomerById(customer);
    }

    //根据id删除客户信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int removeCustomer(Integer customerId) {
        return customerMapper.deleteCustomerById(customerId);
    }
}
