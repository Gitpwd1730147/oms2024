package com.tzb.oms.controller;

import com.tzb.oms.entity.Factory;
import com.tzb.oms.entity.Result;
import com.tzb.oms.mapper.FactoryMapper;
import com.tzb.oms.service.FactoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
@RestController
@RequestMapping("/factoryDic")
public class FactoryController {

    //注入FactoryService
    @Autowired
    private FactoryService factoryService;

    /**
     * 获取工厂信息列表
     * @return
     */
    @GetMapping("/factory")
    public Result getFactoryList(){
        //执行业务
        List<Factory> factoryList = factoryService.queryAllFactory();
        //返回结果
        return Result.ok(factoryList);
    }

    /**
     * 新增工厂信息
     * @param factory
     * @return
     */
    @PostMapping("/factory")
    public Result addFactory(@RequestBody Factory factory){
        //执行业务
        int i = factoryService.addFactory(factory);
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"添加失败");
        }
        return Result.ok("添加成功");
    }

    /**
     * 根据ID修改工厂信息
     * @param id
     * @param factory
     * @return
     */
    @PutMapping("/factory/{id}")
    public Result editFactory(@PathVariable Integer id,@RequestBody Factory factory){
        //封装
        factory.setFactoryId(id);
        //执行业务
        int i = factoryService.editFactoryById(factory);
        //返回结果
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
        }
        return Result.ok("修改成功");
    }

    @DeleteMapping("/factory/{id}")
    public Result delFactory(@PathVariable Integer id){
        //执行业务
        int i = factoryService.removeFactory(id);
        //返回结果
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
        }
        return Result.ok("删除成功");
    }


}
