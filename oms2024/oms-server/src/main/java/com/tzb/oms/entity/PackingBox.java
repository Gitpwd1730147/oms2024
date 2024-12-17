package com.tzb.oms.entity;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/23
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PackingBox implements Serializable {
    private Integer packingBoxId;

    private String specification;

    private Double boxLength;

    private Double boxWidth;

    private Double boxHigh;

    private Double volume;

    private String boxDesc;

    private static final long serialVersionUID = 1L;
}