package com.tzb.oms.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.read.listener.ReadListener;
import com.alibaba.excel.util.ListUtils;
import com.alibaba.fastjson.JSON;
import com.tzb.oms.entity.ShipmentInfo;
import com.tzb.oms.mapper.OrderInfoMapper;
import com.tzb.oms.mapper.PackingBoxMapper;
import com.tzb.oms.mapper.ShipmentInfoMapper;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/25
 */
@Slf4j
public class UploadShipmentDataListener implements ReadListener<ShipmentInfo> {
    /**
     * 每隔5条存储数据库，实际使用中可以100条，然后清理list ，方便内存回收
     */
    private static final int BATCH_COUNT = 100;
    private List<ShipmentInfo> cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);
    /**
     * 假设这个是一个DAO，当然有业务逻辑这个也可以是一个service。当然如果不用存储这个对象没用。
     */
//    private TestService testService;
   private ShipmentInfoMapper shipmentInfoMapper;
   private OrderInfoMapper orderInfoMapper;

   private PackingBoxMapper packingBoxMapper;

    //    private String token;
    private Integer shipmentCodeId;


    /**
     * 如果使用了spring,请使用这个构造方法。每次创建Listener的时候需要把spring管理的类传进来
     *
     * @param
     */
    public UploadShipmentDataListener(ShipmentInfoMapper shipmentInfoMapper,OrderInfoMapper orderInfoMapper,PackingBoxMapper packingBoxMapper,Integer shipmentCodeId) {
        this.shipmentInfoMapper = shipmentInfoMapper;
        this.orderInfoMapper = orderInfoMapper;
        this.packingBoxMapper = packingBoxMapper;
        this.shipmentCodeId = shipmentCodeId;
    }


    /**
     * 这个每一条数据解析都会来调用
     *
     * @param data    one row value. It is same as {@link AnalysisContext#readRowHolder()}
     * @param context
     */
    @Override
    public void invoke(ShipmentInfo data, AnalysisContext context) {

        log.info("解析到一条数据:{}", JSON.toJSONString(data));
        //封装参数
        data.setShipmentCodeId(shipmentCodeId);  //出货单ID

        //订单ID
        String styleName = data.getStyleName();
        String markName = data.getMarkName();
        Integer orderId = orderInfoMapper.selectOrderIdByStyleNameAndMarkName(styleName, markName);  //根据款号和唛头获得订单ID
        data.setOrderId(orderId);

        //包装箱规格id
        Double boxLength = data.getBoxLength();
        Double boxWidth = data.getBoxWidth();
        Double boxHigh = data.getBoxHigh();
        Integer packingBoxId = packingBoxMapper.selectPackingBoxIdByLWH(boxLength, boxWidth, boxHigh);
        data.setPackingBoxId(packingBoxId);

        cachedDataList.add(data);

        // 达到BATCH_COUNT了，需要去存储一次数据库，防止数据几万条数据在内存，容易OOM
        if (cachedDataList.size() >= BATCH_COUNT) {
            saveData();
            // 存储完成清理 list
            cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);
        }
    }

    /**
     * 所有数据解析完成了 都会来调用
     *
     * @param context
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        // 这里也要保存数据，确保最后遗留的数据也存储到数据库
        saveData();
        log.info("所有数据解析完成！");
    }

    /**
     * 加上存储数据库
     */
    private void saveData() {
        log.info("{}条数据，开始存储数据库！", cachedDataList.size());
        shipmentInfoMapper.saveShipmentInfoByExcel(cachedDataList);

        log.info("存储数据库成功！");
    }


}
