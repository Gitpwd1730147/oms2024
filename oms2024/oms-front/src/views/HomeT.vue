<template>
  <el-container class="home-container">
    <el-aside style="width: 217px;">
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
        </el-sub-menu>

        <el-sub-menu index="3">
          <template #title>
            <el-icon><OfficeBuilding /></el-icon>
            <span>订单管理</span>
          </template>
          <el-menu-item index="/order">   <el-icon><OfficeBuilding /></el-icon>订单管理</el-menu-item>
          <el-menu-item index="/orderInfo">   <el-icon><OfficeBuilding /></el-icon>订单统计</el-menu-item>
        </el-sub-menu>
        <el-sub-menu index="4">
          <template #title>
            <el-icon><ShoppingTrolley /></el-icon>
            <span>出货管理</span>
          </template>
          <el-menu-item index="1-1"><el-icon><ShoppingTrolley /></el-icon>出货单设置</el-menu-item>
          <el-menu-item index="1-2"><el-icon><ShoppingTrolley /></el-icon>出货单管理</el-menu-item>
        </el-sub-menu>
        <el-sub-menu index="5">
          <template #title>
            <el-icon><UserFilled /></el-icon>
            <span>用户管理</span>
          </template>
          <el-menu-item index=""><el-icon><UserFilled /></el-icon>用户管理</el-menu-item>
        </el-sub-menu>
      </el-menu>
    </el-aside>
    <el-container class="main-container">
      <el-header>
        <div class="header_left">

          <span style="font-weight: bold;">&nbsp;恒合仓库管理系统</span>
        </div>
        <div class="header_right">
          <span>当前用户：</span>
          <a href="#">退出</a>
        </div>
      </el-header>

      <el-main>

      </el-main>
      <el-footer>版权所有&nbsp;&copy;2000-2022&nbsp; 恒合智能仓储科技有限公司</el-footer>
    </el-container>
  </el-container>
</template>

<script setup>
import { useRouter } from "vue-router";
import {
  HomeFilled,
  OfficeBuilding,
  ShoppingTrolley,
  Memo,
  UserFilled,
} from '@element-plus/icons-vue'
import TagMenu from "@/components/TagMenu.vue";

const router = useRouter(); // 获取路由器


</script>

<style scoped>
.home-container{
  height: 100%;
  display: flex;
}
.main-container{
  display: flex;
  flex-direction: column;
}
.el-header{
  line-height: 60px;

  display: flex;
  justify-content: space-between;
}
.el-header .header_left{
  font-size: 22px;
  font-family: 微软雅黑;
}
.header_left img{
  margin-top: -5px;
  vertical-align: middle;
}
.el-header .header_right{
  padding-right: 20px;
}
.header_right a{
  margin-left: 10px;
}

.el-menu{
  height: 100%;
}
.el-main {
  border-top: 1px solid #CCC;
  border-bottom: 1px solid #CCC;
}
.breadcrumb{
  margin-bottom: 20px;
}
.el-footer {
  text-align: center;
  font-size: 12px;
  height: 40px;
  line-height: 40px;
}
</style>