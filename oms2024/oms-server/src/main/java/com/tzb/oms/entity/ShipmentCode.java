package com.tzb.oms.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AUTHOR: TZB
 * DATE:  2024/6/25
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShipmentCode implements Serializable {
    private Integer shipmentCodeId;

    private String shipmentCodeName;

    private BigDecimal shipmentTotalPrice;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date shipmentDate;

    private String shipmentCodeDesc;

    private static final long serialVersionUID = 1L;
}