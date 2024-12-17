package com.tzb.oms.controller;

import com.tzb.oms.entity.PackingBox;
import com.tzb.oms.entity.Result;
import com.tzb.oms.service.PackingBoxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/23
 */
@RestController
@RequestMapping("/packingBoxDic")
public class PackingBoxController {

    //注入PackingBoxService
    @Resource
    private PackingBoxService packingBoxService;

    /**
     * 获取包装箱列表信息
     * @return
     */
    @GetMapping("/packingBox")
    public Result getPackingBoxList(){
        //执行业务
        List<PackingBox> packingBoxList = packingBoxService.queryAllPackingBox();
        //响应
        return Result.ok(packingBoxList);
    }

    /**
     * 添加包装箱信息
     * @param packingBox
     * @return
     */
    @PostMapping("/packingBox")
    public Result addPackingBox(@RequestBody PackingBox packingBox){
        //封装参数
        String specification = packingBox.getBoxLength() + "cm X " + packingBox.getBoxWidth() + "cm X " + packingBox.getBoxHigh() +"cm";
        packingBox.setSpecification(specification);
        packingBox.setVolume(packingBox.getBoxLength()*packingBox.getBoxWidth()*packingBox.getBoxHigh()*0.000001);
        //执行业务
        Result result = packingBoxService.addPackingBox(packingBox);
         //响应
        return result;
    }

    /**
     * 根据ID修改包装箱信息
     * @param id
     * @param packingBox
     * @return
     */
    @PutMapping("/packingBox/{id}")
    public Result editPackingBox(@PathVariable Integer id,@RequestBody PackingBox packingBox){
        //封装参数
        packingBox.setPackingBoxId(id);
        String specification = packingBox.getBoxLength() + "cm X " + packingBox.getBoxWidth() + "cm X " + packingBox.getBoxHigh() +"cm";
        packingBox.setSpecification(specification);  //重新计算规格
        packingBox.setVolume(packingBox.getBoxLength()*packingBox.getBoxWidth()*packingBox.getBoxHigh()*0.000001);  //重新计算容量

        //执行任务
        Result result = packingBoxService.editPackingBox(packingBox);

        //响应
        return result;
    }

    /**
     * 根据ID删除包装箱信息
     * @param id
     * @return
     */
    @DeleteMapping("/packingBox/{id}")
    public Result delPackingBox(@PathVariable Integer id){
        //执行业务
        Result result = packingBoxService.removePackingBox(id);
        //响应
        return result;
    }
}
