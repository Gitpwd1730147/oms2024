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
public class Factory {
    private Integer factoryId;

    private String factoryName;

    private String factoryBankNo;

    private String factoryContact;

    private String factoryDesc;

    private String factoryCode;
}