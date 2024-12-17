package com.tzb.oms.entity;

import java.io.Serializable;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.tzb.oms.config.converter.TelephoneConverter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/13
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Test implements Serializable {
    @ExcelIgnore
    private Integer id;

    @ExcelProperty(value = "姓名",index = 0)
    private String name;

    @ExcelProperty(value = "年龄",index = 1)
    private Integer age;

    @ExcelProperty(value = "性别",index = 2)
    private String sex;

    @ExcelProperty(value = "电话",index = 3)
    private String telephone;

    @ExcelProperty(value = "测试",index = 4)
    private Double ceshi;

    @ExcelProperty(value = {"包装规格","长"},index = 5)
    private Double chang;

    @ExcelProperty(value = {"包装规格","宽"},index = 6)
    private Double kuan;

    @ExcelProperty(value = {"包装规格","高"},index = 7)
    private Double gao;


    @ExcelIgnore
    private String addr;

    @ExcelIgnore
    private Integer shipmentId;

    @ExcelIgnore
    private Integer orderId;

    private static final long serialVersionUID = 1L;
}