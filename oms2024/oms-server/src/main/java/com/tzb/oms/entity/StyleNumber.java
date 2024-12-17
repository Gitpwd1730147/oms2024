package com.tzb.oms.entity;

import java.math.BigDecimal;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/17
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StyleNumber {
    private Integer styleId;

    private String styleName;

    private String brand;  //品牌

    private String composition;  //成分

    private String barCode;  //条形码

    private String styleImg;

    private String styleColorImg;

    private BigDecimal stylePrice;

    private Integer styleTotal;

    private BigDecimal totalPrice;  //总价

    private String styleDesc;

    private String fabDesc;  //西班牙语描述

    private Integer orderCodeId;
    private String orderCodeName;//订单编码

    private Integer factoryId;
    private String factoryName; //工厂名称
    private String factoryCode; //工厂编码

    private Integer customerId;     //客户id
    private String customerName;    //客户名称

    private List<StyleSize> styleSizeList; //尺码配比列表

    private List<StyleColor> styleColorList; //颜色配比列表

    private List<OrderInfo> orderNumList;  //款号的订单数量


    //计算总数量
    public Integer getStyleTotal(){
        if (orderNumList != null) {
            return orderNumList.stream().mapToInt(OrderInfo::getOrderNum).sum();
        }
       return 0;
    }

    //计算总价值
    public BigDecimal getTotalPrice(){
        return stylePrice.multiply(BigDecimal.valueOf(getStyleTotal()));
    }
}