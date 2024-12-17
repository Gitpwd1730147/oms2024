package com.tzb.oms.page;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * 出货单前端显示类
 * AUTHOR: TZB
 * DATE:  2024/7/25
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@ExcelIgnoreUnannotated
public class Shipment {
    //出货单ID
    private Integer shipmentId;
    @ExcelProperty(value = "数量（打）",index = 6)
    private Integer shipmentNum; //出货数量
    @ExcelProperty(value = "备注",index = 21)
    private String shipmentDesc; //备注

    //出货单编码
    private Integer shipmentCodeId;  //编码ID
    private String shipmentCodeName; //编码名

    //订单信息
    private Integer orderId;  //订单ID
    private Integer styleId;  //款号ID
    @ExcelProperty(value = "款号",index = 0)
    private String styleName; //款号名
    private BigDecimal stylePrice;  //款号单价
    private BigDecimal totalPrice;  //总价
    private String composition;    //成分--款号
    private String brand;   //品牌
    private String barCode;  //条形码
    private String styleDesc;  //描述
    private String fabDesc;   //西班牙语描述

    private Integer markId; //唛头id
    @ExcelProperty(value = "唛头",index = 1)
    private String markName; //唛头名
    private Integer customerId; //客户id
    private String customerName; //客户名称

    private Integer stock;  //库存

    private Integer factoryId; //工厂id
    private String factoryName; //工厂名称
    private String factoryCode; //工厂编码


    //------------追加属性----------

    private Integer packingBoxId;  //包装箱id
    private String specification;  //包装箱规格
    @ExcelProperty(value = {"包装箱规格","长"},index = 11)
    private Double boxLength;   //包装箱长
    @ExcelProperty(value = {"包装箱规格","宽"},index = 12)
    private Double boxWidth;    //包装箱宽
    @ExcelProperty(value = {"包装箱规格","高"},index = 13)
    private Double boxHigh;      //包装箱高
    private Double volume;      //包装箱容积
    private String boxDesc;     //包装箱描述

    @ExcelProperty(value = "打/箱",index = 9)
    private Integer dozPerBox;    //每箱多少打
    private Integer totalBoxNum;    //总箱数
    private Double totalCbm;      //总立方
    @ExcelProperty(value = "每箱净重",index = 16)
    private Double netWeight;     //净重
    private Double totalNetWeight;  //总净重
    @ExcelProperty(value = "每箱毛重",index = 17)
    private Double grossWeight;    //毛重
    private Double totalGrossWeight;  //总毛重
    @ExcelProperty(value = "尺码/包装",index = 20)
    private String tallas;        //尺码

    //计算总价值
    public BigDecimal getTotalPrice(){
        return stylePrice.multiply(BigDecimal.valueOf(shipmentNum));
    }

    //计算总箱数
    public Integer getTotalBoxNum(){
        return shipmentNum/dozPerBox;
    }

    //计算总立方
    public Double getTotalCbm(){
        DecimalFormat df = new DecimalFormat("#.####");
        String format = df.format(getTotalBoxNum() * volume);
        return Double.parseDouble(format);
    }

    //计算总净重
    public Double getTotalNetWeight(){
        DecimalFormat df = new DecimalFormat("#.##");
        String format = df.format(getTotalBoxNum() * netWeight);
        return Double.parseDouble(format);
    }

    //计算总净重
    public Double getTotalGrossWeight(){
        DecimalFormat df = new DecimalFormat("#.##");
        String format = df.format(getTotalBoxNum() * grossWeight);
        return Double.parseDouble(format);
    }
}
