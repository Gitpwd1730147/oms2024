<template>
  <div  style="height: 1086px">
    <el-menu
        active-text-color="#ffd04b"
        background-color="#334157"
        class="el-menu-vertical-demo"
        default-active="2"
        text-color="#fff"
        style="border-right: solid 0"
        unique-opened
        :router="true"
        :collapse="$store.state.isShow"
        :collapse-transition="false"
    >
      <el-sub-menu index="1">
        <template #title>
          <el-icon><HomeFilled/></el-icon>
          <span>系统首页</span>
        </template>
        <el-menu-item index="/home"><el-icon><OfficeBuilding /></el-icon>系统首页</el-menu-item>
      </el-sub-menu>

      <el-sub-menu index="3">
        <template #title>
          <el-icon><OfficeBuilding /></el-icon>
          <span>订单查询</span>
        </template>
        <el-menu-item index="/orderInfo"><el-icon><OfficeBuilding /></el-icon>订单查询</el-menu-item>
      </el-sub-menu>

      <el-sub-menu index="4">
        <template #title>
          <el-icon><ShoppingTrolley /></el-icon>
          <span>出货管理</span>
        </template>
        <el-menu-item index="/shipmentCode"><el-icon><ShoppingTrolley /></el-icon>出货单设置</el-menu-item>
        <el-menu-item index="/shipmentInfo"><el-icon><ShoppingTrolley /></el-icon>出货单管理</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="5">
        <template #title>
          <el-icon><UserFilled /></el-icon>
          <span>用户管理</span>
        </template>
        <el-menu-item index=""><el-icon><UserFilled /></el-icon>用户管理</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="2">
        <template #title>
          <el-icon><Memo /></el-icon>
          <span>数据字典</span>
        </template>
        <el-menu-item index="/orderCode"><el-icon><Memo /></el-icon>订单号管理</el-menu-item>
        <el-menu-item index="/customer"><el-icon><Memo /></el-icon>客户管理</el-menu-item>
        <el-menu-item index="/factory"><el-icon><Memo /></el-icon>工厂管理</el-menu-item>
        <el-menu-item index="/mark"><el-icon><Memo /></el-icon>唛头管理</el-menu-item>
        <el-menu-item index="/styleNumber"><el-icon><Memo /></el-icon>款号管理</el-menu-item>
        <el-menu-item index="/packingBox"><el-icon><Memo /></el-icon>包装箱管理</el-menu-item>
      </el-sub-menu>
    </el-menu>
  </div>
</template>

<script setup>

import {
  HomeFilled,
  Memo,
  OfficeBuilding,
  ShoppingTrolley,
  UserFilled
} from "@element-plus/icons-vue";
</script>

<style  lang='less' scoped>
.menuTitle {
  height: 35px;
  color: #f9f9f9;
  line-height: 38px;
  text-align: center;
  cursor: pointer;
}
.show{
  cursor: pointer;
}
.el-dropdown {
  float: right;
  line-height: 35px;
}
.page1 {
  position: absolute;
  right: 0;
  left: 0;
  bottom: 0;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.el-menu{
  height: 100%;
  width: 200px;
}
</style>