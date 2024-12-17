package com.tzb.oms.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Customer {
    private Integer customerId;

    private String customerName;

    private String customerDesc;
}