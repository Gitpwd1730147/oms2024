package com.tzb.oms.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.fastjson.JSON;
import com.tzb.oms.entity.OrderInfo;
import com.tzb.oms.entity.Result;
import com.tzb.oms.page.Order;
import com.tzb.oms.page.OrderExcel;
import com.tzb.oms.page.Page;
import com.tzb.oms.page.TestExcel;
import com.tzb.oms.service.OrderInfoService;
import com.tzb.oms.utils.OmsConstants;
import org.springframework.web.bind.annotation.*;

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
 * DATE:  2024/6/21
 */
@RequestMapping("/order")
@RestController
public class OrderInfoController {

    //注入OrderInfoService
    @Resource
    private OrderInfoService orderInfoService;


    /**
     * 分页查询订单信息
     * @param page
     * @param order
     * @return
     */
    @GetMapping("/orderInfo")
    public Result queryOrderInfoListForPage(Page page, Order order){
        //执行业务
         page = orderInfoService.queryOrderInfoForPage(page, order);

         //响应
        return Result.ok(page);
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
    @RequestMapping ("/exportExcel")
    public void download(HttpServletResponse response, Order order) throws IOException {

        // 这里注意 有同学反应使用swagger 会导致各种问题，请直接用浏览器或者用postman
        response.setContentType("application/octet-stream");
        response.setCharacterEncoding("utf-8");

        // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
        response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(OmsConstants.ORDER_EXCEL_FILE_NAME+ new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()), StandardCharsets.UTF_8) + ".xlsx");


        List<OrderExcel> orderExcelList = orderInfoService.queryOrderInfoForExcel(order);

        EasyExcel.write(response.getOutputStream(), OrderExcel.class)
                .sheet()
                .doWrite(orderExcelList);
    }

}
