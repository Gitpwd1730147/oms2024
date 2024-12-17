package com.tzb.oms.service;

import com.tzb.oms.entity.OrderInfo;
import com.tzb.oms.entity.Result;
import com.tzb.oms.page.Order;
import com.tzb.oms.page.OrderExcel;
import com.tzb.oms.page.Page;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/6/7
 */
public interface OrderInfoService {

    //新增款号订单数信息
    public Result saveOrderInfo(OrderInfo orderInfo);

    //根据款号id获取响应的订单数量列表
    public List<OrderInfo> queryOrderInfoByStyleId(Integer styleId);

    //根据ID修改订单数量信息
    public Result modifyOrderInfo(OrderInfo orderInfo);

    //根据ID删除订单数量信息
    public Result removeOrderInfo(Integer orderId);

    //分页查询订单信息
    public Page queryOrderInfoForPage(Page page, Order order);

    //根据条件查询数据结果，导出到Excel中
    public List<OrderExcel> queryOrderInfoForExcel(Order order);
}
