package com.tzb.oms.service.impl;

import com.tzb.oms.entity.OrderCode;
import com.tzb.oms.entity.Result;
import com.tzb.oms.mapper.OrderCodeMapper;
import com.tzb.oms.service.OrderCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/14
 */
@Service
public class OrderCodeServiceImpl implements OrderCodeService{

    @Autowired
    private OrderCodeMapper orderCodeMapper;

    //新增订单编码
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result saveOrderCode(OrderCode orderCode) {

        int i = orderCodeMapper.insertOrderCode(orderCode);
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"添加失败");
        }
        return Result.ok("添加成功");
    }

    //获取订单编码列表
    @Override
    public List<OrderCode> queryAllOrderCode() {
        return orderCodeMapper.findAllOrderCode();
    }

    //修改订单编码
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int editOrderCode(OrderCode orderCode) {
        return orderCodeMapper.updateOrderCode(orderCode);
    }

    //删除订单编码
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int removeOrderCodeById(Integer orderCodeId) {
        return orderCodeMapper.delOrderCodeById(orderCodeId);
    }
}
