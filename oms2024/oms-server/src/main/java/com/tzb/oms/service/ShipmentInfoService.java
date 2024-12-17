package com.tzb.oms.service;

import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.ShipmentInfo;
import com.tzb.oms.page.Page;
import com.tzb.oms.page.Shipment;
import com.tzb.oms.page.ShipmentExcel;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/7/24
 */
public interface ShipmentInfoService {
    //新增出货信息
    public Result addShipmentInfo(ShipmentInfo shipmentInfo);

    //分页查询出货信息
    public Page queryShipmentInfoForPage(Page page, Shipment shipment);

    //根据shipmentId删除出货单信息
    public Result removeShipmentInfoByShipmentId(Integer shipmentId);

    //根据ID修改出货单信息
    public Result modifyShipmentInfo(ShipmentInfo shipmentInfo);

    //根据条件查询要导入到Excel的数据
    public List<ShipmentExcel> queryShipmentInfoForExcel(Shipment shipment);

    //从Excel批量上传出货清单
    void importExcel(InputStream inputStream, Integer shipmentCodeId) throws IOException;

}
