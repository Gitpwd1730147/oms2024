package com.tzb.oms.controller;

import com.tzb.oms.entity.Customer;
import com.tzb.oms.entity.Result;
import com.tzb.oms.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/15
 */
@RestController
@RequestMapping("/customerDic")
public class CustomerController {

    //注入CustomerService
    @Autowired
    private CustomerService customerService;

    /**
     * 新增客户
     * @param customer
     * @return
     */
    @PostMapping("/customer")
    public Result addCustomer(@RequestBody Customer customer){
        //执行业务
        int i = customerService.saveCustomer(customer);
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"添加失败");
        }
        return Result.ok("添加成功");
    }

    /**
     * 获取客户信息列表
     * @return
     */
    @GetMapping("/customerList")
    public Result getCustomerList(){
        //执行业务
        List<Customer> customerList = customerService.queryAllCustomer();

        //返回结果
        return Result.ok(customerList);
    }

    /**
     * 根据id修改客户 信息
     * @param id
     * @param customer
     * @return
     */
    @PutMapping("/customer/{id}")
    public Result editCustomer(@PathVariable Integer id,@RequestBody Customer customer){
        //封装参数
        customer.setCustomerId(id);
        //执行业务
        int i = customerService.editCustomer(customer);
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"修改失败");
        }
        return Result.ok("修改成功");
    }


    @DeleteMapping("/customer/{id}")
    public Result delCustomer(@PathVariable Integer id){
        //执行业务
        int i = customerService.removeCustomer(id);
        if (i < 0) {
            return Result.err(Result.CODE_ERR_BUSINESS,"删除失败");
        }
        return Result.ok("删除成功");
    }

}
