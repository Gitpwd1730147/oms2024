package com.tzb.oms.page;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/19
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ExcelIgnoreUnannotated
public class ShipmentExcel {

    @ExcelProperty(value = "出货单号")
    private String shipmentCodeName; //编码名

    @ExcelProperty(value = "款号")
    private String styleName; //款号名

    @ExcelProperty(value = "唛头")
    private String markName; //唛头名

    @ExcelProperty(value = "品名")
    private String fabDesc;   //西班牙语描述

    @ExcelProperty(value = "品牌")
    private String brand;   //品牌

    @ExcelProperty(value = "成分")
    private String composition;    //成分--款号

    @ExcelProperty(value = "条形码")
    private String barCode;  //条形码

    @ExcelProperty(value = "出货量")
    private Integer shipmentNum; //出货数量

    @ExcelProperty(value = "单价")
    private BigDecimal stylePrice;  //款号单价

    @ExcelProperty(value = "总价")
    private BigDecimal totalPrice;  //总价

    @ExcelProperty(value = "打/箱")
    private Integer dozPerBox;    //每箱多少打

    @ExcelProperty(value = "箱数")
    private Integer totalBoxNum;    //总箱数

    @ExcelProperty(value = {"包装箱规格","长"})
    private Double boxLength;   //包装箱长
    @ExcelProperty(value = {"包装箱规格","宽"})
    private Double boxWidth;    //包装箱宽
    @ExcelProperty(value = {"包装箱规格","高"})
    private Double boxHigh;      //包装箱高

    @ExcelProperty(value = "容量")
    private Double volume;      //包装箱容积

    @ExcelProperty(value = "总立方")
    private Double totalCbm;      //总立方

    @ExcelProperty(value = "每箱净重")
    private Double netWeight;     //净重

    @ExcelProperty(value = "每箱毛重")
    private Double grossWeight;    //毛重

    @ExcelProperty(value = "总净重")
    private Double totalNetWeight;  //总净重

    @ExcelProperty(value = "总毛重")
    private Double totalGrossWeight;  //总毛重

    @ExcelProperty(value = "尺码/包装")
    private String tallas;        //尺码

//    @ExcelProperty(value = "工厂名称")
    private String factoryCode; //工厂编码

//    @ExcelProperty(value = "客户")
    private String customerName; //客户名称

//    @ExcelProperty(value = "备注")
    private String shipmentDesc; //备注



    private Integer packingBoxId;  //包装箱id
    private String specification;  //包装箱规格

    private String boxDesc;     //包装箱描述








    private String styleDesc;  //描述



    //出货单ID
    private Integer shipmentId;


    private String factoryName; //工厂名称

    //出货单编码
    private Integer shipmentCodeId;  //编码ID


    //订单信息
    private Integer orderId;  //订单ID
    private Integer styleId;  //款号ID




    private Integer markId; //唛头id

    private Integer customerId; //客户id


    private Integer stock;  //库存

    private Integer factoryId; //工厂id




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
