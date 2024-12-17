package com.tzb.oms.mapper;

import com.tzb.oms.entity.OrderCode;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/14
 */
public interface OrderCodeMapper {
    /**
     * 添加订单编码
     * @param orderCode
     * @return
     */
    public int insertOrderCode(OrderCode orderCode);

    /**
     * 查询所有订单编码
     * @return
     */
    public List<OrderCode> findAllOrderCode();

    /**
     * 根据id修改订单编码
     * @param orderCode
     * @return
     */
    public int updateOrderCode(OrderCode orderCode);

    /**
     * 根据id删除订单编码
     * @param orderCodeId
     * @return
     */
    public int delOrderCodeById(Integer orderCodeId);
}
