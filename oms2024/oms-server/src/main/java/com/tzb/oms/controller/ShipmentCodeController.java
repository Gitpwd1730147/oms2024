package com.tzb.oms.controller;

import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.ShipmentCode;
import com.tzb.oms.page.Page;
import com.tzb.oms.service.ShipmentCodeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/6/25
 */
@RestController
@RequestMapping("/shipment")
public class ShipmentCodeController {

    //注入ShipmentCodeService
    @Resource
    private ShipmentCodeService shipmentCodeService;

    /**
     * 新增出货单编码
     * @param shipmentCode
     * @return
     */
    @PostMapping("/shipmentCode")
    public Result addShipmentCode(@RequestBody ShipmentCode shipmentCode){
        //执行业务
        Result result = shipmentCodeService.saveShipmentCode(shipmentCode);
        //响应
        return result;
    }


    /**
     * 分页查询出货单编码列表
     * @param page
     * @param shipmentCode
     * @return
     */
    @GetMapping("/shipmentCode")
    public Result getShipmentCodeList(Page page,ShipmentCode shipmentCode){
        //执行业务
         page = shipmentCodeService.queryShipmentCodeForPage(page, shipmentCode);

        //响应
        return Result.ok(page);
    }

    /**
     * 修改出货单编码
     * @param shipmentCode
     * @return
     */
    @PutMapping("/shipmentCode")
    public Result modifyShipmentCode(@RequestBody ShipmentCode shipmentCode){
        //执行业务
        int i = shipmentCodeService.editShipmentCode(shipmentCode);
        //响应
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
        }
        return Result.ok("修改成功");
    }

    /**
     *根据ID删除出货单编码
     * @param id
     * @return
     */
    @DeleteMapping("/shipmentCode/{id}")
    public Result delShipmentCode(@PathVariable Integer id){
        //执行业务
        int i = shipmentCodeService.removeShipmentCode(id);
        //响应
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
        }
        return Result.ok("删除成功");
    }

    @GetMapping("/shipmentCodeList")
    public Result getShipmentCodeList(){
        //执行业务
        List<ShipmentCode> shipmentCodeList = shipmentCodeService.queryAllShipmentCode();
        //响应
        return Result.ok(shipmentCodeList);
    }
}
