package com.tzb.oms.page;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.tzb.oms.config.converter.TelephoneConverter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/18
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestExcel {

    @ExcelProperty(value = "编号")
    private Integer id;

    @ExcelProperty(value = "姓名")
    private String name;

    @ExcelProperty(value = "年龄")
    private Integer age;

    @ExcelProperty(value = "性别")
    private String sex;

    @ExcelProperty(value = "电话")
    private String telephone;
}
