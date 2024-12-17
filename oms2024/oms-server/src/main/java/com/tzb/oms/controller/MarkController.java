package com.tzb.oms.controller;

import com.tzb.oms.entity.Mark;
import com.tzb.oms.entity.Result;
import com.tzb.oms.service.MarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
@RestController
@RequestMapping("/markDic")
public class MarkController {
    //注入MarkService
    @Autowired
    private MarkService markService;

    /**
     * 获取唛头列表
     * @return
     */
    @GetMapping("/mark")
    public Result getMarkList(){
        //执行业务
        List<Mark> markList = markService.queryAllMark();
        //返回结果
        return Result.ok(markList);
    }

    /**
     * 新增唛头
     * @param mark
     * @return
     */
    @PostMapping("/mark")
    public Result addMark(@RequestBody Mark mark){
        //执行业务
        int i = markService.saveMakr(mark);
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"添加失败");
        }
        return Result.ok("添加成功");
    }

    /**
     * 编辑唛头
     * @param id
     * @param mark
     * @return
     */
    @PutMapping("/mark/{id}")
    public Result editMark(@PathVariable Integer id,@RequestBody Mark mark){
        //封装参数
        mark.setMarkId(id);
        //执行业务
        int i = markService.modifyMark(mark);
        //返回结果
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
        }
        return Result.ok("修改成功");
    }


    @DeleteMapping("/mark/{id}")
    public Result delMark(@PathVariable Integer id){
        //执行业务
        int i = markService.removeMark(id);
        //返回结果
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
        }
        return Result.ok("删除成功");
    }

}
