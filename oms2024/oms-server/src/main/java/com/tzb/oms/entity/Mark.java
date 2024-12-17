package com.tzb.oms.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mark {
    private Integer markId;

    private String markName;

    private String markDesc;

    private Integer customerId;

    private String customerName;
}