package com.tzb.oms.mapper;

import com.tzb.oms.entity.OrderInfo;
import com.tzb.oms.entity.StyleNumber;
import com.tzb.oms.page.Order;
import com.tzb.oms.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/6/3
 */
public interface OrderInfoMapper {

    /**
     * 根据款号id获取响应的订单数量列表
     * @param styleId
     * @return
     */
    public List<OrderInfo> selectOrderInfoByStyleId(Integer styleId);

    /**
     * 新增款号订单数信息
     * @param orderInfo
     * @return
     */
    public int insertOrderInfo(OrderInfo orderInfo);

    /**
     * 根据ID修改订单数量信息
     * @param orderInfo
     * @return
     */
    public int updateOrderInfo(OrderInfo orderInfo);

    /**
     * 根据ID删除订单数量信息
     * @param orderId
     * @return
     */
    public int deleteOrderInfo(Integer orderId);

    /**
     * 根据款号ID删除响应的订单数量信息
     * @param styleId
     * @return
     */
    public int deleteOrderInfoByStyleId(Integer styleId);

    /**
     * 根据查询条件获得款号id列表
     * @param styleNumber
     * @return
     */
    public List<Integer> selectStyleIdByQueryCondition(StyleNumber styleNumber);

    /**
     * 查询订单总行数
     * @param order
     * @return
     */
    public int selectOrderInfoCount(Order order);

    /**
     * 分页查询订单信息
     * @param page
     * @param order
     * @return
     */
    public List<Order> selectOrderInfoForPage(@Param("page") Page page, @Param("order") Order order);

    /**
     * 根据orderId查询订单信息
     * @param orderId
     * @return
     */
    public OrderInfo selectOrderInfoByOrderId(Integer orderId);

    /**
     * 根据条件查询数据结果，导出到Excel中
     * @param order
     * @return
     */
    public List<Order> selectOrderInfoForExcel(@Param("order") Order order);

    /**
     * 根据款号和唛头查询出订单编号orderId
     * @param styleName
     * @param markName
     * @return
     */
    public Integer selectOrderIdByStyleNameAndMarkName(@Param("styleName") String styleName,@Param("markName") String markName);
}