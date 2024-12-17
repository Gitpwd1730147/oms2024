package com.tzb.oms.service.impl;

import com.tzb.oms.entity.OrderInfo;
import com.tzb.oms.entity.Result;
import com.tzb.oms.mapper.OrderInfoMapper;
import com.tzb.oms.page.Order;
import com.tzb.oms.page.OrderExcel;
import com.tzb.oms.page.Page;
import com.tzb.oms.service.OrderInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/6/7
 */
@Service
public class OrderInfoServiceImpl implements OrderInfoService {

    //注入OrderInfoMapper
    @Resource
    private OrderInfoMapper orderInfoMapper;

    //新增订单信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result saveOrderInfo(OrderInfo orderInfo) {
        //执行业务
        int i = orderInfoMapper.insertOrderInfo(orderInfo);
        //响应
        if (i > 0) {
            return Result.ok("添加成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"添加失败");
    }

    //获取订单信息列表
    @Override
    public List<OrderInfo> queryOrderInfoByStyleId(Integer styleId) {
        return orderInfoMapper.selectOrderInfoByStyleId(styleId);
    }

    //修改订单信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result modifyOrderInfo(OrderInfo orderInfo) {
        //执行业务
        int i = orderInfoMapper.updateOrderInfo(orderInfo);
        //响应
        if (i > 0) {
            return Result.ok("修改成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
    }

    //删除订单信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result removeOrderInfo(Integer orderId) {
        //执行业务
        int i = orderInfoMapper.deleteOrderInfo(orderId);
        //响应
        if (i > 0) {
            return Result.ok("删除成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
    }

    //分页查询订单信息
    @Override
    public Page queryOrderInfoForPage(Page page, Order order) {
       //获取订单信息总行数
        int orderInfoCount = orderInfoMapper.selectOrderInfoCount(order);

        //分页查询
        List<Order> orderInfoList = orderInfoMapper.selectOrderInfoForPage(page, order);

        //封装参数
        page.setTotalNum(orderInfoCount);
        page.setResultList(orderInfoList);
        //响应
        return page;
    }

    //根据条件查询结果，导入到Excel
    @Override
    public List<OrderExcel> queryOrderInfoForExcel(Order order) {
        //创建存放orderExcel的空表
        List<OrderExcel> orderExcelList = new ArrayList<>();

        //执行查询
        List<Order> orderList = orderInfoMapper.selectOrderInfoForExcel(order);

        //把从数据库查询出来的List<Order>，转换为List<OrderExcel>数据
        orderList.forEach(orderInfo -> {
            OrderExcel orderExcel = new OrderExcel();  //创建OrderExcel对象
            //需要一个个设置，封装数据
            orderExcel.setOrderCodeName(orderInfo.getOrderCodeName());
            orderExcel.setStyleName(orderInfo.getStyleName());
            orderExcel.setStylePrice(orderInfo.getStylePrice());
            orderExcel.setMarkName(orderInfo.getMarkName());
            orderExcel.setOrderNum(orderInfo.getOrderNum());
            orderExcel.setStock(orderInfo.getStock());
            orderExcel.setTotalPrice(orderInfo.getTotalPrice());
            orderExcel.setFactoryName(orderInfo.getFactoryName());
            orderExcel.setCustomerName(orderInfo.getCustomerName());
            orderExcel.setOrderDesc(orderInfo.getOrderDesc());

            orderExcelList.add(orderExcel);
        });
        return orderExcelList;
    }


}
