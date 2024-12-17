package com.tzb.oms.controller;

import com.alibaba.excel.EasyExcel;
import com.tzb.oms.entity.*;
import com.tzb.oms.page.Page;
import com.tzb.oms.page.TestExcel;
import com.tzb.oms.service.OrderInfoService;
import com.tzb.oms.service.StyleColorService;
import com.tzb.oms.service.StyleNumberService;
import com.tzb.oms.service.StyleSizeService;
import com.tzb.oms.utils.OmsConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/20
 */
@RequestMapping("/styleDic")
@RestController
public class StyleController {

    //注入StyleNumberService
    @Autowired
    private StyleNumberService styleNumberService;

    //注入StyleColorService
    @Autowired
    private StyleColorService styleColorService;

    //注入StyleSizeService
    @Autowired
    private StyleSizeService styleSizeService;

    //注入OrderInfoService
    @Resource
    private OrderInfoService orderInfoService;


    /**
     * 将配置文件的file.upload-path属性值注入给控制器的uploadPath属性,
     * 其为图片上传到项目的目录路径(类路径classes即resources下的static/img/upload);
     */
    @Value("${file.upload-path}")
    private String uploadPath;

    /**
     * 上传图片的url接口/styleDic/img-upload
     *
     * 参数MultipartFile file对象封装了上传的图片;
     *
     * @CrossOrigin表示该url接口允许跨域请求;
     */
    @CrossOrigin
    @PostMapping("/img-upload")
    public Result uploadImg(MultipartFile file){


        try {
            //拿到图片上传到的目录(类路径classes下的static/img/upload)的File对象
            File uploadDirFile = ResourceUtils.getFile(uploadPath);

            //拿到图片上传到的目录的磁盘路径
            String uploadDirPath = uploadDirFile.getAbsolutePath();

            //给图片重新以日期命名
            String picName = file.getOriginalFilename();  //获取原文件名
            if (picName != null) {  //获取后缀名
                String suffix = picName.substring(picName.lastIndexOf(".") + 1);
            // 新的文件名以日期命名:
            String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + "." + suffix;
                System.out.println(fileName);
            //拿到图片保存到的磁盘路径
            String fileUploadPath = uploadDirPath + "\\" + fileName ;

            //保存图片
            file.transferTo(new File(fileUploadPath));

            //成功响应
            return Result.ok("图片上传成功",fileName);
           }
            return Result.err(Result.CODE_ERR_BUSINESS, "图片上传失败！");
        } catch (IOException e) {
            //失败响应
            return Result.err(Result.CODE_ERR_BUSINESS, "图片上传失败！");
        }
    }


    /**
     * 添加款号
     * @param styleNumber
     * @return
     */
    @PostMapping("/styleNumber")
    public Result addStyleNumber(@RequestBody StyleNumber styleNumber){
        //执行业务
        Result result = styleNumberService.SaveStyleNumber(styleNumber);
        //响应
        return result;
    }


    /**
     * 分页查询款号信息
     * @param page
     * @param styleNumber
     * @return
     */
    @GetMapping("/styleNumber")
    public Result styleNumberList(Page page,StyleNumber styleNumber){
        //执行业务
        page = styleNumberService.queryStyleNumberPage(page, styleNumber);

        //响应
        return Result.ok(page);
    }

    /**
     * 根据款号id列表，分页查询款号信息
     * @param page
     * @param styleNumber
     * @return
     */
    @GetMapping("/styleNumberList")
    public Result styleNumberListForPage(Page page,StyleNumber styleNumber){
        //执行业务
        page = styleNumberService.queryStyleNumberByStyleIdListForPage(page, styleNumber);

        //响应
        return Result.ok(page);
    }

    @Value("${file.access-path}")
    private String accessPath;

    /**
     * 根据ID修改款号
     * @param id
     * @param styleNumber
     * @return
     */
    @PutMapping("/styleNumber/{id}")
    public Result editStyleNumber(@PathVariable Integer id,@RequestBody StyleNumber styleNumber){

        //封装参数
        styleNumber.setStyleId(id);
        //执行业务
        Result result = styleNumberService.modifyStyleNumber(styleNumber);
        //响应
        return result;
    }

    /**
     * 根据ID删除款号
     * @param id
     * @return
     */
    @DeleteMapping("/styleNumber/{id}")
    public Result delStyleNumber(@PathVariable Integer id){
        //执行业务
        Result result = styleNumberService.removeStyleNumber(id);

        //响应
        return result;

    }

    /**
     * 修改颜色配比图片
     * @param styleNumber
     * @return
     */
    @PutMapping("/styleNumber")
    public Result editStyleColorImg(@RequestBody StyleNumber styleNumber){
        //执行业务
        Result result = styleNumberService.modifyStyleColorImg(styleNumber);
        //响应
        return result;
    }

    /**
     * 新增颜色配比
     * @param styleColor
     * @return
     */
    @PostMapping("/styleColor")
    public Result addStyleColorMatching(@RequestBody StyleColor styleColor){
        //执行业务
        int i = styleColorService.saveStyleColor(styleColor);
        //响应
        if (i > 0) {
            return Result.ok("添加成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"添加失败");
    }

    /**
     * 根据款号ID获取颜色配比列表
     * @param id
     * @return
     */
    @GetMapping("/styleColorList/{id}")
    public Result getStyleColorList(@PathVariable Integer id){
        //执行业务
        List<StyleColor> styleColorList = styleColorService.queryStyleColorByStyleId(id);
        //响应
        return Result.ok(styleColorList);
    }

    /**
     * 根据ID修改颜色配比
     * @param id
     * @return
     */
    @DeleteMapping("/styleColor/{id}")
    public Result delStyleColor(@PathVariable Integer id){
        //执行业务
        Result result = styleColorService.removeStyleColorMatching(id);
        //响应
        return result;
    }

    /**
     * 根据ID修改颜色配比
     * @param id
     * @param styleColor
     * @return
     */
    @PutMapping("/styleColor/{id}")
    public Result editStyleColor(@PathVariable Integer id,@RequestBody StyleColor styleColor){
        //封装数据
        styleColor.setStyleColorId(id);
        //执行业务
        Result result = styleColorService.modifyStyleColorMatching(styleColor);
        //响应
        return result;
    }

    /**
     * 新增尺码配比
     * @param styleSize
     * @return
     */
    @PostMapping("/styleSize")
    public Result addStyleSize(@RequestBody StyleSize styleSize){
        //执行业务
        int i = styleSizeService.saveStyleSize(styleSize);
        //响应
        if (i > 0) {
            return Result.ok("添加成功");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"添加失败");
    }

    /**
     * 获取尺码配比列表
     * @param id
     * @return
     */
    @GetMapping("/styleSizeList/{id}")
    public Result getStyleSizeList(@PathVariable Integer id){
        //执行业务
        List<StyleSize> styleSizeList = styleSizeService.queryStyleSizeByStyleId(id);
        //响应
        return Result.ok(styleSizeList);
    }

    /**
     * 修改尺码配比信息
     * @param id
     * @param styleSize
     * @return
     */
    @PutMapping("/styleSize/{id}")
    public Result editStyleSize(@PathVariable Integer id,@RequestBody StyleSize styleSize){
        //封装参数
        styleSize.setStyleSizeId(id);
        //执行业务
        Result result = styleSizeService.modifyStyleSize(styleSize);
        //响应
        return result;
    }

    /**
     * 根据ID删除响应的尺码配比
     * @param id
     * @return
     */
    @DeleteMapping("/styleSize/{id}")
    public Result delStyleSize(@PathVariable Integer id){
        //执行业务
        Result result = styleSizeService.removeStyleSize(id);
        //响应
        return result;
    }


    /**
     * 新增款号订单数量
     * @param orderInfo
     * @return
     */
    @PostMapping("/orderNum")
    private Result addOrderNum(@RequestBody OrderInfo orderInfo){
        //执行业务
        Result result = orderInfoService.saveOrderInfo(orderInfo);
        //响应
        return result;
    }


    /**
     * 根据款号id获取订单数量列表
     * @param id
     * @return
     */
    @GetMapping("/orderNumList/{id}")
    public Result getOrderNumList(@PathVariable Integer id){
        //执行业务网
        List<OrderInfo> orderInfoList = orderInfoService.queryOrderInfoByStyleId(id);
        //响应
        return Result.ok(orderInfoList);
    }

    /**
     * 根据ID修改订单数量信息
     * @param id
     * @param orderInfo
     * @return
     */
    @PutMapping("/orderNum/{id}")
    public Result editOrderInfo(@PathVariable Integer id,@RequestBody OrderInfo orderInfo){
        //封装参数
        orderInfo.setOrderId(id);
        //执行业务
        Result result = orderInfoService.modifyOrderInfo(orderInfo);
        //响应
        return result;
    }

    /**
     * 根据ID删除订单数量信息
     * @param id
     * @return
     */
    @DeleteMapping("/orderNum/{id}")
    public Result delOrderInfo(@PathVariable Integer id){
        //执行业务
        Result result = orderInfoService.removeOrderInfo(id);
        //响应
        return result;
    }

    /**
     * 从Excel批量导入
     * @param file
     * @return
     */
    @PostMapping("/importExcel")
    public Result importExcel(MultipartFile file,Integer hh) throws IOException {
       styleNumberService.importExcel(file.getInputStream(),hh);
        return Result.ok("导入成功");
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
    @GetMapping("/exportExcel")
    public void download(HttpServletResponse response) throws IOException {
        // 这里注意 有同学反应使用swagger 会导致各种问题，请直接用浏览器或者用postman
        response.setContentType("application/octet-stream");
        response.setCharacterEncoding("utf-8");

        // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
//        String fileName = URLEncoder.encode("测试", "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(OmsConstants.EXCEL_FILE_NAME+System.currentTimeMillis(), StandardCharsets.UTF_8) + ".xlsx");

        List<TestExcel> testExcelList = styleNumberService.queryAllTestByExcel();

        EasyExcel.write(response.getOutputStream(), TestExcel.class)
                .sheet()
                .doWrite(testExcelList);
    }

}
