package com.tzb.oms.entity;

import java.io.Serializable;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AUTHOR: TZB
 * DATE:  2024/7/24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ExcelIgnoreUnannotated
public class ShipmentInfo implements Serializable {
    private Integer shipmentId;

    private Integer shipmentCodeId;

    private Integer orderId;
    @ExcelProperty(value = "款号",index = 0)
    private String styleName; //款号名
    @ExcelProperty(value = "唛头",index = 1)
    private String markName; //唛头名

    @ExcelProperty(value = "数量（打）",index = 6)
    private Integer shipmentNum;

    private String shipmentDesc;

    //------------追加属性----------

    private Integer packingBoxId;  //包装箱id
    @ExcelProperty(value = {"包装箱规格","长"},index = 11)
    private Double boxLength;   //包装箱长
    @ExcelProperty(value = {"包装箱规格","宽"},index = 12)
    private Double boxWidth;    //包装箱宽
    @ExcelProperty(value = {"包装箱规格","高"},index = 13)
    private Double boxHigh;      //包装箱高

    @ExcelProperty(value = "打/箱",index = 9)
    private Integer dozPerBox;    //每箱多少打
    private Double totalCbm;      //总立方
    @ExcelProperty(value = "每箱净重",index = 16)
    private Double netWeight;     //净重
    @ExcelProperty(value = "每箱毛重",index = 17)
    private Double grossWeight;    //毛重
    @ExcelProperty(value = "尺码/包装",index = 20)
    private String tallas;        //尺码

    private static final long serialVersionUID = 1L;
}