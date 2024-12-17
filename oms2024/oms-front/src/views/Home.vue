<template >
  <div>
    <el-container style="height:100%">
      <el-header>
        <!-- 头部区域 -->
        <Header></Header>
      </el-header>

      <el-container style="height: 100%">
        <el-aside :width="$store.state.isShow?'64px':'200px'" style="height: 100%">
          <!-- 左侧菜单 -->
          <Menu> </Menu>
        </el-aside>

        <el-main>
          <!-- 导航菜单 -->
          <TagMenu></TagMenu>
          <!-- 主体内容 -->
          <router-view style="height: 100%" v-slot="{Component}">
            <keep-alive :max="8">
              <component :is="Component"></component>
            </keep-alive>
          </router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>


</template>

<script setup>
import Header from '@/components/Header.vue';
import Menu from '@/components/Menu.vue';
import TagMenu from '@/components/TagMenu.vue';


</script>

<style lang='less' scoped>
.el-header{
  background: #1AA094;
}
.el-main{
  background: #F2F4F5;
  height: 100%;
}
.el-aside{
  background: #334157;
  height: 100%;
}

</style>
