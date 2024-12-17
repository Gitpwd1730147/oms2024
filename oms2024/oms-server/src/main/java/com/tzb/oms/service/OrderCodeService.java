package com.tzb.oms.service;

import com.tzb.oms.entity.OrderCode;
import com.tzb.oms.entity.Result;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/14
 */
public interface OrderCodeService {
    //添加订单编码
    public Result saveOrderCode(OrderCode orderCode);

    //查询所有的订单编码
    public List<OrderCode> queryAllOrderCode();

    //根据id修改订单编码
    public int editOrderCode(OrderCode orderCode);

    //根据id删除订单编码、
    public int removeOrderCodeById(Integer orderCodeId);
}
