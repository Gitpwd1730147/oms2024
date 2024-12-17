package com.tzb.oms.controller;

import com.alibaba.excel.EasyExcel;
import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.ShipmentInfo;
import com.tzb.oms.page.*;
import com.tzb.oms.service.ShipmentInfoService;
import com.tzb.oms.utils.OmsConstants;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/7/24
 */
@RestController
@RequestMapping("/shipment")
public class ShipmentInfoController {

    //注入ShipmentInfoService
    @Resource
    private ShipmentInfoService shipmentInfoService;


    /**
     * 新增出货信息
     * @param shipmentInfo
     * @return
     */
    @PostMapping("/shipmentInfo")
    public Result addShipmentInfo(@RequestBody ShipmentInfo shipmentInfo){
        //执行业务
        Result result = shipmentInfoService.addShipmentInfo(shipmentInfo);
        //响应
        return result;
    }

    /**
     * 分页查询出货单信息
     * @param page
     * @param shipment
     * @return
     */
    @GetMapping("/shipmentInfo")
    public Result getShipmentInfoListForPage(Page page, Shipment shipment){
        //执行业务
         page = shipmentInfoService.queryShipmentInfoForPage(page, shipment);
         //响应
        return Result.ok(page);
    }

    /**
     * 删除出货单信息
     * @param id
     * @return
     */
    @DeleteMapping("/shipmentInfo/{id}")
    public Result delShipmentInfo(@PathVariable Integer id){
        //执行业务
        Result result = shipmentInfoService.removeShipmentInfoByShipmentId(id);

        //响应
        return result;
    }

    /**
     * 修改出货单信息
     * @param shipmentInfo
     * @return
     */
    @PutMapping("/shipmentInfo")
    public Result editShipmentInfo(@RequestBody ShipmentInfo shipmentInfo){
        //执行业务
        Result result = shipmentInfoService.modifyShipmentInfo(shipmentInfo);
        //响应
        return result;
    }

    /**
     * 文件下载（失败了会返回一个有部分数据的Excel）
     * <p>
     * 1. 创建excel对应的实体对象 参照{@link}
     * <p>
     * 2. 设置返回的 参数
     * <p>
     * 3. 直接写，这里注意，finish的时候会自动关闭OutputStream,当然你外面再关闭流问题不大
     */
    @GetMapping ("/exportExcel")
    public void download(HttpServletResponse response, Shipment shipment) throws IOException {

        // 这里注意 有同学反应使用swagger 会导致各种问题，请直接用浏览器或者用postman
        response.setContentType("application/octet-stream");
        response.setCharacterEncoding("utf-8");

        // 这里URLEncoder.encode可以防止中文乱码 当然和easyExcel没有关系
        response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(OmsConstants.SHIPMENT_EXCEL_FILE_NAME+ new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()), StandardCharsets.UTF_8) + ".xlsx");


        List<ShipmentExcel> shipmentExcelList = shipmentInfoService.queryShipmentInfoForExcel(shipment);

        EasyExcel.write(response.getOutputStream(), ShipmentExcel.class)
                .sheet()
                .doWrite(shipmentExcelList);
    }

    /**
     * 从Excel批量导入
     * @param file
     * @return
     */
    @PostMapping("/importExcel")
    public Result importExcel(MultipartFile file, Integer shipmentCodeId) throws IOException {
       shipmentInfoService.importExcel(file.getInputStream(),shipmentCodeId);
        return Result.ok("导入成功");
    }

}
