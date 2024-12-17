package com.tzb.oms.service;

import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.ShipmentCode;
import com.tzb.oms.page.Page;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/6/25
 */
public interface ShipmentCodeService {
    //新增出货单编码
    public Result saveShipmentCode(ShipmentCode shipmentCode);

    //分页查询出货单号
    public Page queryShipmentCodeForPage(Page page,ShipmentCode shipmentCode);

    //根据出货单编码ID修改出货单编码
    public int editShipmentCode(ShipmentCode shipmentCode);

    //根据出货单编码ID删除编码信息
    public int removeShipmentCode(Integer shipmentCodeId);

    //获取出货单编码列表
    public List<ShipmentCode> queryAllShipmentCode();
}
