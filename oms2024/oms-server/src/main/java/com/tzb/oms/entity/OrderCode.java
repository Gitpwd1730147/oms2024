package com.tzb.oms.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/14
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderCode {

    private Integer orderCodeId; //订单号id

    private String orderCodeName; //订单号

    private String orderCodeDesc;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createDate;
}
