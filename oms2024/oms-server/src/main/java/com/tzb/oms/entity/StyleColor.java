package com.tzb.oms.entity;

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
public class StyleColor {
    private Integer styleColorId;

    private String colorName;

    private Integer colorMatching;

    private Integer styleId;
}