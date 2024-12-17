package com.tzb.oms.controller;

import com.tzb.oms.entity.OrderCode;
import com.tzb.oms.entity.Result;
import com.tzb.oms.service.OrderCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/14
 */
@RestController
@RequestMapping("/orderDic")
public class OrderDicController {
    //注入OrderCodeService
    @Autowired
    private OrderCodeService orderCodeService;

    /**
     * 新增订单编码
     * @param orderCode
     * @return
     */
    @PostMapping("/orderCode")
    public Result addOrderCode(@RequestBody OrderCode orderCode){
        //执行业务
        Result result = orderCodeService.saveOrderCode(orderCode);
        return result;
    }

    /**
     *获取订单编码列表
     * @return
     */
    @GetMapping("/orderCodeList")
    public Result getAllOrderCode(){
        List<OrderCode> orderCodeList = orderCodeService.queryAllOrderCode();
        return Result.ok(orderCodeList);
    }

    /**
     * 根据id修改订单编码
     * @param orderCode
     * @return
     */
    @RequestMapping ("/editOrderCode")
    public Result editOrderCode(@RequestBody OrderCode orderCode){

        int i = orderCodeService.editOrderCode(orderCode);
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
        }
        return Result.ok();
    }


    /**
     * 根据id删除订单编码
     * @param orderCodeId
     * @return
     */
    @DeleteMapping ("/delOrderCode/{orderCodeId}")
    public Result delOrderCode(@PathVariable Integer orderCodeId){
        //执行业务
        int i = orderCodeService.removeOrderCodeById(orderCodeId);
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
        }
        return Result.ok("删除成功");
    }

}
