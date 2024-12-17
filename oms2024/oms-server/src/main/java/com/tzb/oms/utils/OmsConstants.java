package com.tzb.oms.utils;

/**
 * 常量类:
 */
public interface OmsConstants {

    //用户未审核
    public String USER_STATE_NOT_PASS = "0";

    //用户已审核
    public String USER_STATE_PASS = "1";

    //传递token的请求头名称
    public String HEADER_TOKEN_NAME = "Token";

    public static final String EXCEL_FILE_NAME = "客户信息";

    public static final String ORDER_EXCEL_FILE_NAME = "订单信息表";
    public static final String SHIPMENT_EXCEL_FILE_NAME = "出货清单";
}
