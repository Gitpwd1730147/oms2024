package com.tzb.oms.mapper;

import com.tzb.oms.entity.ShipmentInfo;
import com.tzb.oms.page.Page;
import com.tzb.oms.page.Shipment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/7/24
 */
public interface ShipmentInfoMapper {

    /**
     * 新增出货信息
     * @param shipmentInfo
     * @return
     */
    public int insertShipmentInfo(ShipmentInfo shipmentInfo);

    /**
     * 查询出货单总行数
     * @param shipment
     * @return
     */
    public int selectShipmentInfoCount(Shipment shipment);

    /**
     * 分页查询出货单信息
     * @param page
     * @param shipment
     * @return
     */
    public List<Shipment> selectShipmentInfoForPage(@Param("page")Page page, @Param("shipment") Shipment shipment);

    /**
     * 根据shipmentId删除出货单信息
     * @param shipmentId
     * @return
     */
    public int deleteShipmentInfoByShipmentId(Integer shipmentId);

    /**
     * 根据shipmentId查询出货单信息
     * @param shipmentId
     * @return
     */
    public ShipmentInfo selectShipmentInfoByShipmentId(Integer shipmentId);

    /**
     * 根据ID修改出货单信息
     * @param shipmentInfo
     * @return
     */
    public int updateShipmentInfo(ShipmentInfo shipmentInfo);

    /**
     * 根据条件查询出货单信息，导入Excel
     * @param shipment
     * @return
     */
    public List<Shipment> selectShipmentInfoForExcel(@Param("shipment") Shipment shipment);

    /**
     * 从Excel批量导入shipmentInfo
     * @param shipmentInfoList
     */
    void saveShipmentInfoByExcel(List<ShipmentInfo> shipmentInfoList);
}