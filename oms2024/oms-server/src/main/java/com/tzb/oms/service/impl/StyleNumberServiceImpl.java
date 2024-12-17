package com.tzb.oms.service.impl;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.listener.ReadListener;
import com.tzb.oms.entity.*;
import com.tzb.oms.listener.UploadDataListener;
import com.tzb.oms.mapper.*;
import com.tzb.oms.page.Page;
import com.tzb.oms.page.TestExcel;
import com.tzb.oms.service.StyleNumberService;
import com.tzb.oms.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/20
 */
@Service
public class StyleNumberServiceImpl implements StyleNumberService {

    //注入StyleNumberMapper
    @Autowired
    private StyleNumberMapper styleNumberMapper;

    //注入StyleColorMapper
    @Autowired
    private StyleColorMapper styleColorMapper;

    //注入StyleSizeMapper
    @Autowired
    private StyleSizeMapper styleSizeMapper;

    //注入OrderInfoMapper
    @Resource
    private OrderInfoMapper orderInfoMapper;

    //注入TestMapper
    @Resource
    private TestMapper testMapper;

    @Autowired
    private TestService testService;


    /*
     将配置文件的file.access-path属性值注入给service的accessPath属性,
    * 其为上传的图片保存到数据库中的访问地址的目录路径/img/upload/;
    */
    @Value("${file.access-path}")
    private String accessPath;

    //添加款号
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result SaveStyleNumber(StyleNumber styleNumber) {

        //处理上传的图片的访问地址---/img/upload/图片名称
        styleNumber.setStyleImg(accessPath + styleNumber.getStyleImg());

        //添加款号
        int i = styleNumberMapper.insertStyleNumber(styleNumber);
        if (i > 0) {
            return Result.ok("添加成功！");
        }
        return Result.err(Result.CODE_ERR_BUSINESS,"添加失败！");
    }

    //分页查询款号
    @Override
    public Page queryStyleNumberPage(Page page, StyleNumber styleNumber) {

        //查询款号总行数
        int styleNumberCount = styleNumberMapper.selectStyleNumberCount(styleNumber);

        //分页查询
        List<StyleNumber> styleNumberList = styleNumberMapper.selectStyleNumberPage(page, styleNumber);

       //遍历款号列表，封装配比信息
        for (StyleNumber number : styleNumberList) {

            //获得款号id
            Integer styleId = number.getStyleId();
            //获得此款号下的颜色配比和尺码配比
            List<StyleColor> styleColorList = styleColorMapper.selectStyleColorByStyleId(styleId);
            List<StyleSize> styleSizeList = styleSizeMapper.selectStyleSizeByStyleId(styleId);
            List<OrderInfo> orderInfoList = orderInfoMapper.selectOrderInfoByStyleId(styleId);
            //封装
            number.setStyleColorList(styleColorList);
            number.setStyleSizeList(styleSizeList);
            number.setOrderNumList(orderInfoList);
        }

        //封装数据到Page对象
        page.setTotalNum(styleNumberCount);
        page.setResultList(styleNumberList);
        //响应
        return page;
    }


    //根据ID修改款号
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result modifyStyleNumber(StyleNumber styleNumber) {

        //根据id查询要修改的款号信息
        StyleNumber styleNumber1 = styleNumberMapper.selectStyleNumberById(styleNumber.getStyleId());

        //获得相应的图片信息
        String styleImg = styleNumber1.getStyleImg();  //款号图片


        //款号图片是否更改
        if (!styleNumber.getStyleImg().startsWith(accessPath)) { //说明更改了图片，则删除原来的图片

            if (styleImg.length() > 12) {//原来有图片，删除后更改
                try {
                    //拿到图片上传到的目录(类路径classes下的static/img/upload)的File对象
                    File uploadDirFile = ResourceUtils.getFile(uploadPath);

                    //拿到图片上传到的目录的磁盘路径
                    String uploadDirPath = uploadDirFile.getAbsolutePath();

                    //获取图片名称（“/图片全名”）
                    String substring = styleImg.substring(11);

                    //删除图片
                    File file = new File(uploadDirPath +substring);
                    boolean delete = file.delete();


                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }
            styleNumber.setStyleImg(accessPath + styleNumber.getStyleImg());
        }


        //更新款号信息
        int i = styleNumberMapper.updateStyleNumber(styleNumber);
        //响应
        if (i > 0) {
            return Result.ok("修改成功");
        }

        return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
    }

    /**
     * 将配置文件的file.upload-path属性值注入给控制器的uploadPath属性,
     * 其为图片上传到项目的目录路径(类路径classes即resources下的static/img/upload);
     */
    @Value("${file.upload-path}")
    private String uploadPath;

    //根据id删除款号
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result removeStyleNumber(Integer styleId) {
        //获得款号信息
        StyleNumber styleNumber = styleNumberMapper.selectStyleNumberById(styleId);
        //删除款号
        int i = styleNumberMapper.deleteStyleNumber(styleId);
        if (i > 0) {
            //判断是否有款号图片,有的话就删除
            String styleImg = styleNumber.getStyleImg();
            if (styleImg.length() > 12) {
                try {
                    //拿到图片上传到的目录(类路径classes下的static/img/upload)的File对象
                    File uploadDirFile = ResourceUtils.getFile(uploadPath);

                    //拿到图片上传到的目录的磁盘路径
                    String uploadDirPath = uploadDirFile.getAbsolutePath();

                    //获取图片名称（“/图片全名”）
                    String substring = styleImg.substring(11);

                    //删除图片
                    File file = new File(uploadDirPath +substring);
                    boolean delete = file.delete();

                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }

            //判断是否有颜色配比图片，有得话删除
            String styleColorImg = styleNumber.getStyleColorImg();
            if (styleColorImg.length() > 12) {
                try {
                    //拿到图片上传到的目录(类路径classes下的static/img/upload)的File对象
                    File uploadDirFile = ResourceUtils.getFile(uploadPath);

                    //拿到图片上传到的目录的磁盘路径
                    String uploadDirPath = uploadDirFile.getAbsolutePath();

                    //获取图片名称（“/图片全名”）
                    String substring = styleColorImg.substring(11);

                    //删除图片
                    File file = new File(uploadDirPath +substring);
                    boolean delete = file.delete();

                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }

            //删除颜色配比信息
            int i1 = styleColorMapper.deleteStyleColorMatchingByStyleId(styleId);
            if (i1 < 0) {
                return Result.err(Result.CODE_ERR_BUSINESS,"删除颜色配比失败");
            }

            //删除尺码配比信息
            int i2 = styleSizeMapper.deleteStyleSizeByStyleId(styleId);
            if (i2 < 0) {
                return Result.err(Result.CODE_ERR_BUSINESS,"删除尺码配比失败");
            }

            //删除订单数量信息
            int i3 = orderInfoMapper.deleteOrderInfoByStyleId(styleId);
            if (i3 < 0) {
                return Result.err(Result.CODE_ERR_BUSINESS,"删除订单数量失败");
            }

            return Result.ok("删除成功！");
        }

        return Result.err(Result.CODE_ERR_BUSINESS,"删除失败！");

    }

    //根据ID修改款号颜色配比图
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Result modifyStyleColorImg(StyleNumber styleNumber) {

        //根据id查询要修改的款号信息
        StyleNumber styleNumber1 = styleNumberMapper.selectStyleNumberById(styleNumber.getStyleId());

        //获得相应的图片信息
        String styleColorImg = styleNumber1.getStyleColorImg();

        //颜色配比图片是否更改
        if (!styleNumber.getStyleColorImg().startsWith(accessPath) && styleColorImg != null) { //说明更改了图片，则删除原来的图片

                try {
                    //拿到图片上传到的目录(类路径classes下的static/img/upload)的File对象
                    File uploadDirFile = ResourceUtils.getFile(uploadPath);

                    //拿到图片上传到的目录的磁盘路径
                    String uploadDirPath = uploadDirFile.getAbsolutePath();

                    //获取图片名称（“/图片全名”）
                    String substring = styleColorImg.substring(11);

                    //删除图片
                    File file = new File(uploadDirPath +substring);
                    boolean delete = file.delete();

                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
        }

        //更新图片路径
        styleNumber.setStyleColorImg(accessPath + styleNumber.getStyleColorImg());
        //更新款号
        int i = styleNumberMapper.updateStyleColorImg(styleNumber);
        //响应
        if (i > 0) {
            return Result.ok("修改成功");
        }

        return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
    }

    //根据款号id列表获得款号信息列表
    @Override
    public Page queryStyleNumberByStyleIdListForPage(Page page, StyleNumber styleNumber) {
        //根据查询条件获取款号id列表
        List<Integer> styleIdList = orderInfoMapper.selectStyleIdByQueryCondition(styleNumber);
        //款号总行数
        int styleNumberCount = styleIdList.size();
        //分页查询
        List<StyleNumber> styleNumberList = styleNumberMapper.selectStyleNumberByStyleIdListForPage(page, styleIdList);

        //遍历款号列表，封装配比信息
        for (StyleNumber number : styleNumberList) {
            //获得款号id
            Integer styleId = number.getStyleId();
            //获得此款号下的颜色配比和尺码配比
            List<StyleColor> styleColorList = styleColorMapper.selectStyleColorByStyleId(styleId);
            List<StyleSize> styleSizeList = styleSizeMapper.selectStyleSizeByStyleId(styleId);
            List<OrderInfo> orderInfoList = orderInfoMapper.selectOrderInfoByStyleId(styleId);
            //封装
            number.setStyleColorList(styleColorList);
            number.setStyleSizeList(styleSizeList);
            number.setOrderNumList(orderInfoList);
        }

        //封装数据到Page对象
        page.setTotalNum(styleNumberCount);
        page.setResultList(styleNumberList);
        //响应
        return page;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void importExcel(InputStream inputStream,Integer hh) {
        System.out.println("订单号：" + hh);
        //3各参数，第一个参数是要读取的Excel文件，第二个参数是Excel模板类
        EasyExcel.read(inputStream, Test.class, new UploadDataListener(testService,hh))
                .sheet()
                .headRowNumber(2)
                .doRead();
    }

    @Override
    public List<TestExcel> queryAllTestByExcel() {
        // 新建列表
        List<TestExcel> testExcelList = new ArrayList<>();

        //执行业务
        List<Test> testList = testMapper.selectAllTestByExcel();

        //把从数据库查询出来的List<Test>，转换为List<TestExcel>数据
        testList.forEach(test -> {
            TestExcel testExcel = new TestExcel();
            //需要一个个设置
            testExcel.setId(test.getId());
            testExcel.setName(test.getName());
            testExcel.setAge(test.getAge());
            testExcel.setSex(test.getSex());
            testExcel.setTelephone(test.getTelephone());

            testExcelList.add(testExcel);

        });
        return testExcelList;
    }


}
