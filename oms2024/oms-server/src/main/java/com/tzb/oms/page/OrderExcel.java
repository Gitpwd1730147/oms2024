package com.tzb.oms.page;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/18
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ExcelIgnoreUnannotated
public class OrderExcel {
    //订单ID
    private Integer orderId;

    private Integer orderCodeId; //订单编码id
    @ExcelProperty(value = "订单编码")
    private String orderCodeName; //订单编码

    private Integer styleId;  //款号id
    @ExcelProperty(value = "款号")
    private String styleName; //款号名称

    private Integer factoryId; //工厂id
    @ExcelProperty(value = "所属工厂")
    private String factoryName; //工厂名称
    private String factoryCode;  //工厂编码

    private Integer markId;     //唛头id
    @ExcelProperty(value = "唛头")
    private String markName;    //唛头名称
    private String markDesc;    //唛头描述

    private Integer customerId; //唛头所属客户id
    @ExcelProperty(value = "所属客户")
    private String customerName; //唛头所属客户名称

    @ExcelProperty(value = "数量")
    private Integer orderNum;  //订单数量

    @ExcelProperty(value = "库存")
    private Integer stock;  //库存

    @ExcelProperty(value = "描述")
    private String orderDesc;  //订单描述

    //------------追加属性-------------------------
    @ExcelProperty(value = "单价（元/打）")
    private BigDecimal stylePrice;  //款号单价

    @ExcelProperty(value = "总价")
    private BigDecimal totalPrice;  //总价

    //    //计算总价值
    public BigDecimal getTotalPrice(){
        return stylePrice.multiply(BigDecimal.valueOf(orderNum));
    }
}
