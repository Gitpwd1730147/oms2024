package com.tzb.oms.service.impl;

import com.alibaba.excel.EasyExcel;
import com.tzb.oms.entity.OrderInfo;
import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.ShipmentInfo;
import com.tzb.oms.entity.Test;
import com.tzb.oms.listener.UploadDataListener;
import com.tzb.oms.listener.UploadShipmentDataListener;
import com.tzb.oms.mapper.OrderInfoMapper;
import com.tzb.oms.mapper.PackingBoxMapper;
import com.tzb.oms.mapper.ShipmentInfoMapper;
import com.tzb.oms.page.Page;
import com.tzb.oms.page.Shipment;
import com.tzb.oms.page.ShipmentExcel;
import com.tzb.oms.service.ShipmentInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/7/24
 */
@Service
public class ShipmentInfoServiceImpl implements ShipmentInfoService {

    //注入ShipmentInfoMapper
    @Resource
    private ShipmentInfoMapper shipmentInfoMapper;

    //注入OrderInfoMapper
    @Resource
    private OrderInfoMapper orderInfoMapper;

    //注入、PackingBoxMapper
    @Resource
    private PackingBoxMapper packingBoxMapper;

    //新增出货信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result addShipmentInfo(ShipmentInfo shipmentInfo) {

        //执行业务---新增出货信息
        int i = shipmentInfoMapper.insertShipmentInfo(shipmentInfo);

        if (i > 0) {//新增出货信息成功，修改订单库存
            //根据orderId获取订单信息
            Integer orderId = shipmentInfo.getOrderId();  //获取orderId
            OrderInfo orderInfo = orderInfoMapper.selectOrderInfoByOrderId(orderId);

            //封装数据
            orderInfo.setStock(orderInfo.getStock()-shipmentInfo.getShipmentNum());

            //修改订单信息库存
            int j = orderInfoMapper.updateOrderInfo(orderInfo);

            //响应
            if (j < 0) {
                return Result.err(Result.CODE_ERR_BUSINESS,"修改库存失败");
            }

            return Result.ok("成功添加到出货单");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"添加到出货单失败");
    }

    //分页查询出货信息
    @Override
    public Page queryShipmentInfoForPage(Page page, Shipment shipment) {
        //获取出货信息总行数
        int shipmentInfoCount = shipmentInfoMapper.selectShipmentInfoCount(shipment);

        //分页查询
        List<Shipment> shipmentList = shipmentInfoMapper.selectShipmentInfoForPage(page, shipment);

        //封装参数
        page.setTotalNum(shipmentInfoCount);
        page.setResultList(shipmentList);

        //响应
        return page;
    }

    //删除出货单信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result removeShipmentInfoByShipmentId(Integer shipmentId) {
        //根据id获得出货单信息
        ShipmentInfo shipmentInfo = shipmentInfoMapper.selectShipmentInfoByShipmentId(shipmentId);

        //执行删除
        int i = shipmentInfoMapper.deleteShipmentInfoByShipmentId(shipmentId);

        //响应
        if (i > 0) {//出货单信息删除成功，修改订单信息库存

            //获得之前删除的出货数量和orderId
            Integer shipmentNum = shipmentInfo.getShipmentNum();
            Integer orderId = shipmentInfo.getOrderId();

            //获得订单详细信息
            OrderInfo orderInfo = orderInfoMapper.selectOrderInfoByOrderId(orderId);

            //获得库存
            Integer stock = orderInfo.getStock();

            //重新封装参数
            orderInfo.setStock(stock + shipmentNum);

            //修改库存
            int j = orderInfoMapper.updateOrderInfo(orderInfo);
            if (j < 0) {
                return Result.err(Result.CODE_ERR_BUSINESS,"库存修改失败");
            }
            return Result.ok("删除成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
    }

    //根据ID修改出货单信息
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result modifyShipmentInfo(ShipmentInfo shipmentInfo) {
        //获得旧的出货单信息
        ShipmentInfo shipmentInfoOld = shipmentInfoMapper.selectShipmentInfoByShipmentId(shipmentInfo.getShipmentId());

        //执行业务
        int i = shipmentInfoMapper.updateShipmentInfo(shipmentInfo);

        //响应
        if (i > 0) {//修改出货信息成功--修改订单信息库存
            //获得订单信息
            OrderInfo orderInfo = orderInfoMapper.selectOrderInfoByOrderId(shipmentInfo.getOrderId());
            //封装参数
            Integer shipmentNumO = shipmentInfoOld.getShipmentNum();  //旧的出货量
            Integer stock = orderInfo.getStock();  //旧的库存
            Integer shipmentNum = shipmentInfo.getShipmentNum(); //新的出货量

            orderInfo.setStock(stock + shipmentNumO - shipmentNum);

            //修改库存
            int j = orderInfoMapper.updateOrderInfo(orderInfo);

            if (j < 0) {
                return Result.err(Result.CODE_ERR_BUSINESS,"库存修改失败");
            }
            return Result.ok("修改成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
    }

    //根据条件查询要导入到Excel的数据
    @Override
    public List<ShipmentExcel> queryShipmentInfoForExcel(Shipment shipment) {
        //创建空列表存放ShipmentExcel对象
        List<ShipmentExcel> shipmentExcelList = new ArrayList<>();

        //根据条件查询获得结果
        List<Shipment> shipmentList = shipmentInfoMapper.selectShipmentInfoForExcel(shipment);

        //把查询出来的List<Shipment>数据，转换为 List<ShipmentExcel>数据
        shipmentList.forEach(shipmentInfo -> {
            //创建ShipmentExcel对象
            ShipmentExcel shipmentExcel = new ShipmentExcel();
            //封装数据给对象赋值
            shipmentExcel.setShipmentCodeName(shipmentInfo.getShipmentCodeName());
            shipmentExcel.setStyleName(shipmentInfo.getStyleName());
            shipmentExcel.setMarkName(shipmentInfo.getMarkName());
            shipmentExcel.setFabDesc(shipmentInfo.getFabDesc());
            shipmentExcel.setBrand(shipmentInfo.getBrand());
            shipmentExcel.setComposition(shipmentInfo.getComposition());
            shipmentExcel.setBarCode(shipmentInfo.getBarCode());
            shipmentExcel.setStylePrice(shipmentInfo.getStylePrice());
            shipmentExcel.setShipmentNum(shipmentInfo.getShipmentNum());
            shipmentExcel.setTotalPrice(shipmentInfo.getTotalPrice());
            shipmentExcel.setDozPerBox(shipmentInfo.getDozPerBox());
            shipmentExcel.setTotalBoxNum(shipmentInfo.getTotalBoxNum());
            shipmentExcel.setBoxLength(shipmentInfo.getBoxLength());
            shipmentExcel.setBoxWidth(shipmentInfo.getBoxWidth());
            shipmentExcel.setBoxHigh(shipmentInfo.getBoxHigh());
            shipmentExcel.setVolume(shipmentInfo.getVolume());
            shipmentExcel.setTotalCbm(shipmentInfo.getTotalCbm());
            shipmentExcel.setNetWeight(shipmentInfo.getNetWeight());
            shipmentExcel.setGrossWeight(shipmentInfo.getGrossWeight());
            shipmentExcel.setTotalNetWeight(shipmentInfo.getTotalNetWeight());
            shipmentExcel.setTotalGrossWeight(shipmentInfo.getTotalGrossWeight());
            shipmentExcel.setTallas(shipmentInfo.getTallas());
//            shipmentExcel.setFactoryCode(shipmentInfo.getFactoryCode());
//            shipmentExcel.setCustomerName(shipmentInfo.getCustomerName());
            shipmentExcel.setShipmentDesc(shipmentInfo.getShipmentDesc());
            //添加列表
            shipmentExcelList.add(shipmentExcel);
        } );
        return shipmentExcelList;
    }

    //从Excel批量上传出货清单
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void importExcel(InputStream inputStream, Integer shipmentCodeId) throws IOException {
        //3各参数，第一个参数是要读取的Excel文件，第二个参数是Excel模板类
        EasyExcel.read(inputStream, ShipmentInfo.class, new UploadShipmentDataListener(shipmentInfoMapper,orderInfoMapper,packingBoxMapper,shipmentCodeId))
                .sheet()
                .headRowNumber(2)
                .doRead();
    }


}
