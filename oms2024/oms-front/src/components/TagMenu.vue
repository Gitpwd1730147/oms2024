<template>
  <div class="tag-main">
    <el-tabs
        v-model="activeTable"
        type="card"
        @tabRemove="removeTab"
        @tabChange="changeHandle"
        style="max-width:1138px;flex: 1;"
    >

      <el-tab-pane :closable="item.path !== '/home'"
                   v-for="item in tabsList"
                   :key="item.path"
                   :label="item.title"
                   :name="item.path">
      </el-tab-pane>
    </el-tabs>

    <el-dropdown @command="commandHandle">
            <span class="el-dropdown-link">
                <el-icon>
                    <ArrowDown />
                </el-icon>
            </span>
      <template #dropdown>
        <el-dropdown-menu>
          <el-dropdown-item command="closeOther">关闭其他</el-dropdown-item>
          <el-dropdown-item command="closeAll">关闭所有</el-dropdown-item>
        </el-dropdown-menu>
      </template>
    </el-dropdown>
  </div>

</template>

<script setup>
import {ref} from 'vue'
import {useRoute,useRouter,onBeforeRouteUpdate} from 'vue-router'
import {ArrowDown} from "@element-plus/icons-vue";

const route = useRoute()
const router = useRouter()

//定义当前菜单激活选项
const activeTable = ref(route.path)


//tabs菜单数据源
const tabsList = ref([
  {
    title: '系统首页',
    path: '/home'
  },
  {
    title: '订单查询',
    path: '/orderInfo'
  },

])

//声明方法--初始化标签当前列表
function initTabsList() {
  const isTabsList = JSON.parse(window.sessionStorage.getItem('tabList'))
  if (isTabsList) {
    tabsList.value = isTabsList
  }
}
// 调用方法
initTabsList()



// 标签数据源tabsList添加数据
const addTab = (obj) => {
  const isTab = tabsList.value.findIndex(item=>item.path === obj.path) === -1
  if (isTab){
    tabsList.value.push(obj)
  }
  //把tabList保存到本地
  window.sessionStorage.setItem('tabList',JSON.stringify(tabsList.value))
}

//
onBeforeRouteUpdate((to,from)=>{
  //将新的路由地址设置成激活项
  activeTable.value = to.path

  //向数组中追加数据，调用方法addTab
  addTab({
    title: to.meta.title,
    path: to.path
  })
})

//选择事件
const changeHandle = (path)=>{
  activeTable.value = path
  router.push(path)
}

//移除事件
const removeTab = (path)=>{
//path是要移除的路由地址，从name属性中获得item.path
//   console.log(path)

  //判断要移除的标签是否处于激活状态，若是要转换路由
//   获取当前激活的标签
  let isTabs = activeTable.value

  //获取标签菜单的数据源
  const tabs=tabsList.value

  //删除的是激活标签，将激活标签设成上一个或者下一个
  if (path === isTabs) {
    tabs.forEach((item,index)=>{
      if (item.path === path) {
        //找到需要删除的标签，获取上一个或者下一个标签
        const nextTab = tabs[index + 1] || tabs[index - 1]
        if (nextTab) {
          isTabs = nextTab.path
        }
      }
    })
  }

  //重新设置激活标签
  activeTable.value = isTabs
  //路由转换
  router.push(isTabs)

  //从tabsList删除选中的标签，使用数据过滤filter，生成新的数组
  tabsList.value = tabsList.value.filter(item => item.path !== path)

  //重新设置本地存储
  window.sessionStorage.setItem('tabList',JSON.stringify(tabsList.value))

}

//删除其他或者所有
const commandHandle=(res)=>{
  if (res === 'closeOther'){
    //关闭其他，只保留当前活动页和首页
    tabsList.value = tabsList.value.filter(item=>item.path === '/home' || item.path === activeTable.value)
  }

  if (res === 'closeAll') {
    //关闭所有，将标签切换回首页
    activeTable.value = '/home'
    //数据源只保留首页
    tabsList.value = [
      {
        title: '后台首页',
        path: '/home'
      }
    ]
    // 路由转换
    router.push('/home')
  }
  //更新本地存储
  window.sessionStorage.setItem('tabList',JSON.stringify(tabsList.value))
}

</script>

<style lang='less' scoped>
.tag-main {
  display: flex;
  background: #dbdbdb;
  overflow: hidden;
  padding-top: 7px;
  padding-bottom: 2px;
}
.el-dropdown {
  background: #fff;
  width: 30px;
  height: 34px;
  border-radius: 4px;
  margin-left: auto;
  display: flex;
  margin-right: 10px;
  // 水平方向居中
  justify-content: center;
  line-height: 43px;
}

:deep(.el-tabs__header) {
  margin: 0px;
}
:deep(.el-tabs__nav) {
  border: 0 !important
}
:deep(.el-tabs__item) {
  border: 0 !important;
  background: #fff;
  margin-left: 10px;
  height: 34px;
  line-height: 34px !important;
  border-radius: 4px;
}
:deep(.el-tabs__header) {
  border: none !important
}
</style>
