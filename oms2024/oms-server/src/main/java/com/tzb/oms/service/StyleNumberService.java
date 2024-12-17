package com.tzb.oms.service;

import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.StyleNumber;
import com.tzb.oms.page.Page;
import com.tzb.oms.page.TestExcel;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/20
 */
public interface StyleNumberService {

    //添加款号
    public Result SaveStyleNumber(StyleNumber styleNumber);

    //分页查询款号
    public Page queryStyleNumberPage(Page page,StyleNumber styleNumber);

    //根据ID修改款号
    public Result modifyStyleNumber(StyleNumber styleNumber);

    //根据ID删除款号
    public Result removeStyleNumber(Integer styleId);

    //根据ID修改款号颜色配比图
    public Result modifyStyleColorImg(StyleNumber styleNumber);

    //根据款号id列表获得款号信息列表
    public Page queryStyleNumberByStyleIdListForPage(Page page,StyleNumber styleNumber);

    void importExcel(InputStream inputStream,Integer hh) throws IOException;

    public List<TestExcel> queryAllTestByExcel();
}
