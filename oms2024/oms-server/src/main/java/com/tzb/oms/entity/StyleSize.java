package com.tzb.oms.entity;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/17
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StyleSize implements Serializable {
    private Integer styleSizeId;

    private Integer styleId;

    private String sizeName;

    private Integer sizeMatching;

    private static final long serialVersionUID = 1L;
}