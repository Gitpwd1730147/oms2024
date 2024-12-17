package com.tzb.oms.mapper;

import com.tzb.oms.entity.ShipmentCode;
import com.tzb.oms.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/6/25
 */
public interface ShipmentCodeMapper {

    /**
     * 新增出货单编码
     * @param shipmentCode
     * @return
     */
    public int insertShipmentCode(ShipmentCode shipmentCode);

    /**
     * 查询出货单编码总行数
     * @param shipmentCode
     * @return
     */
    public int selectShipmentCodeCount(ShipmentCode shipmentCode);

    /**
     * 分页查询出货单编码
     * @param page
     * @param shipmentCode
     * @return
     */
    public List<ShipmentCode> selectShipmentCodeForPage(@Param("page")Page page, @Param("shipmentCode") ShipmentCode shipmentCode);

    /**
     * 根据出货单编码ID修改出货单编码
     * @param shipmentCode
     * @return
     */
    public int updateShipmentCode(ShipmentCode shipmentCode);

    /**
     * 根据出货单编码ID删除编码信息
     * @param shipmentCodeId
     * @return
     */
    public int deleteShipmentCode(Integer shipmentCodeId);

    /**
     * 获取出货单编码列表
     * @return
     */
    public List<ShipmentCode> selectShipmentCodeList();
}