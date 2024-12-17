package com.tzb.oms.page;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.math.BigDecimal;

/**
 * 订单详细信息类
 * AUTHOR: TZB
 * DATE:  2024/6/3
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Order {
    //订单ID
    private Integer orderId;

    private Integer orderCodeId; //订单编码id
    private String orderCodeName; //订单编码

    private Integer styleId;  //款号id
    private String styleName; //款号名称

    private Integer factoryId; //工厂id
    private String factoryName; //工厂名称
    private String factoryCode;  //工厂编码

    private Integer markId;     //唛头id
    private String markName;    //唛头名称
    private String markDesc;    //唛头描述

    private Integer customerId; //唛头所属客户id
    private String customerName; //唛头所属客户名称

    private Integer orderNum;  //订单数量

    private Integer stock;  //库存

    private String orderDesc;  //订单描述

    //------------追加属性-------------------------
    private BigDecimal stylePrice;  //款号单价

    private BigDecimal totalPrice;  //总价

//    //计算总价值
    public BigDecimal getTotalPrice(){
        return stylePrice.multiply(BigDecimal.valueOf(orderNum));
    }
}
