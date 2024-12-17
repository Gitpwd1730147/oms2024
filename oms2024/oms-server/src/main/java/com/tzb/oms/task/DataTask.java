package com.tzb.oms.task;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/18
 */
@EnableScheduling  //开启定时任务
@Component
public class DataTask {
   /* //调度的意思
    @Scheduled(fixedDelay = 3000)  //确定的延时时间，数字表示，单位毫秒
    @Scheduled(fixedDelayString = "3000")  //确定的延时时间，字符串表示，单位毫秒
    @Scheduled(fixedRate = 3000)   //确定的速率/比例，数字表示，单位毫秒
    @Scheduled(fixedRateString ="3000")   //确定的速率/比例，字符串表示，单位毫秒
    */



}
