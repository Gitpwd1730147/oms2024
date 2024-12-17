package com.tzb.oms.service.impl;

import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.ShipmentCode;
import com.tzb.oms.mapper.ShipmentCodeMapper;
import com.tzb.oms.page.Page;
import com.tzb.oms.service.ShipmentCodeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/6/25
 */
@Service
public class ShipmentCodeServiceImpl implements ShipmentCodeService {

    //注入ShipmentCodeMapper
    @Resource
    private ShipmentCodeMapper shipmentCodeMapper;

    //新增出货单编码
    @Override
    public Result saveShipmentCode(ShipmentCode shipmentCode) {
        //执行业务
        int i = shipmentCodeMapper.insertShipmentCode(shipmentCode);
        //响应
        if (i < 1) {
            return Result.err(Result.CODE_ERR_BUSINESS,"添加失败！");
        }
        return Result.ok("添加成功！");
    }

    //分页查询出货单编码
    @Override
    public Page queryShipmentCodeForPage(Page page, ShipmentCode shipmentCode) {
        //获取总行数
        int shipmentCodeCount = shipmentCodeMapper.selectShipmentCodeCount(shipmentCode);

        //分页查询
        List<ShipmentCode> shipmentCodeList = shipmentCodeMapper.selectShipmentCodeForPage(page, shipmentCode);

        //封装参数
        page.setTotalNum(shipmentCodeCount);
        page.setResultList(shipmentCodeList);

        //返回
        return page;
    }

    //根据出货单编码ID修改出货单编码
    @Override
    public int editShipmentCode(ShipmentCode shipmentCode) {
        return shipmentCodeMapper.updateShipmentCode(shipmentCode);
    }

    //根据出货单编码ID删除编码信息
    @Override
    public int removeShipmentCode(Integer shipmentCodeId) {
        return shipmentCodeMapper.deleteShipmentCode(shipmentCodeId);
    }

    //获取出货单编码列表
    @Override
    public List<ShipmentCode> queryAllShipmentCode() {
        return shipmentCodeMapper.selectShipmentCodeList();
    }


}
