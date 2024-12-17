package com.tzb.oms.mapper;

import com.tzb.oms.entity.Customer;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
public interface CustomerMapper {

    /**
     * 添加客户信息
     * @param customer
     * @return
     */
    public int addCustomer(Customer customer);

    /**
     * 获取客户信息列表
     * @return
     */
    public List<Customer> selectAllCustomer();

    /**
     * 根据客户id修改客户信息
     * @param customer
     * @return
     */
    public int updateCustomerById(Customer customer);

    /**
     * 根据id删除客户信息
     * @param customerId
     * @return
     */
    public int deleteCustomerById(Integer customerId);
}