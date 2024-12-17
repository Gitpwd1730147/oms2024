<template>
  <div>
    <el-card style="height:100%">
      <el-tabs v-model="queryData.factoryId" @tab-change="getData">
        <el-tab-pane label="全部" name=""></el-tab-pane>
        <el-tab-pane v-for="fact in factoryList" :label="fact.factoryName" :name="fact.factoryId"></el-tab-pane>
      </el-tabs>

      <el-row :gutter="30">
        <el-col :span="8">
          <el-input v-model="queryData.styleName" placeholder="请输入款号" clearable @clear="getData">
            <template #prepend>
              <el-select style="width: 180px" v-model="queryData.orderCodeId" placeholder="请选择订单编码" clearable @clear="getData">
                <el-option v-for="item in orderCodeList" :key="item.orderCodeId" :label="item.orderCodeName" :value="item.orderCodeId" >{{item.orderCodeName}}</el-option>
              </el-select>
            </template>

            <template #append>
              <el-button icon="Search" @click="getData" />
            </template>
          </el-input>
        </el-col>
        <el-col :span="8">

        </el-col>
      </el-row>

      <!--款号列表-->
      <el-row style="height: 100%">
        <el-col>
          <el-table :data="tableData" style="width: 100%;">
            <el-table-column type="index" width="70" align="center"  label="序号" />
            <el-table-column align="center" prop="styleName"  label="款号"></el-table-column>
            <el-table-column align="center" label="款号图片">
              <template #default="scope">
                <el-image
                    :preview-src-list="['http://localhost:9999/oms' + scope.row.styleImg]"
                    style="width: 100px; height: 100px"
                    :src="'http://localhost:9999/oms' + scope.row.styleImg"
                    fit="fill"
                    hide-on-click-modal
                    preview-teleported
                />
              </template>
            </el-table-column>
            <el-table-column align="center" label="颜色配比">
              <el-table-column align="center" label="配比图片" >
                <template #default="scope">
                  <el-image
                      :preview-src-list="['http://localhost:9999/oms' + scope.row.styleColorImg]"
                      style="width: 100px; height: 100px"
                      :src="'http://localhost:9999/oms' + scope.row.styleColorImg"
                      fit="fill"
                      hide-on-click-modal
                      preview-teleported
                  />
                </template>
              </el-table-column>
              <el-table-column align="center" label="配比">
               <template #default="scope">
                 <div v-for="item in scope.row.styleColorList">
                  <span>{{item.colorName}} <---> {{item.colorMatching}}</span>
                 </div>
               </template>
              </el-table-column>
            </el-table-column>
            <el-table-column align="center" label="尺码配比">
              <template #default="scope">
                <div v-for="item in scope.row.styleSizeList">
                  <span>{{item.sizeName}} <---> {{item.sizeMatching}}</span>
                </div>
              </template>
            </el-table-column>
            <el-table-column prop="stylePrice"  align="center" label="单价（元/打）">
              <template #default="scope">
                <el-text type="danger">￥ </el-text>{{scope.row.stylePrice}}
              </template>
            </el-table-column>
            <el-table-column align="center" label="详细数量">
              <el-table-column align="center" label="唛头">
                <template #default="scope">
                  <div v-for="item in scope.row.orderNumList">
                    <span>{{item.markName}}</span>
                  </div>
                </template>
              </el-table-column>
              <el-table-column align="center" label="数量">
                <template #default="scope">
                  <div v-for="item in scope.row.orderNumList">
                    <span>{{item.orderNum}}</span>
                  </div>
                </template>
              </el-table-column>
            </el-table-column>
            <el-table-column prop="styleTotal" align="center" label="总数量"/>
            <el-table-column prop="totalPrice" align="center" label="总价" >
              <template #default="scope">
                <el-text type="danger">￥ </el-text>{{scope.row.totalPrice}}
              </template>
            </el-table-column>

            <el-table-column prop="factoryName" align="center" sortable label="所属工厂"/>
            <el-table-column prop="styleDesc" align="center" label="备注"/>

          </el-table>
        </el-col>
      </el-row>
      <!-- 分页 -->
      <div class="page1">
        <el-pagination
            background
            :total="queryData.totalNum"
            :page-sizes="[5, 10, 15, 20, 25, 30]"
            v-model:page-size="queryData.pageSize"
            v-model:currentPage="queryData.pageNum"
            layout="total, sizes, prev, pager, next, jumper"
            style="margin-top: 20px;"
            @size-change="changeSize"
            @current-change="changeCurrent"
        />
      </div>

    </el-card>
  </div>
</template>

<script setup>

import {reactive, ref} from "vue";
import {ElMessage} from "element-plus";
import {getStyleNumberListFn} from "@/api/dic/styleNumber.js";
import {getFactoryListFn} from "@/api/dic/factory.js";
import {getOrderCodeListFn} from "@/api/orderDic.js";

//订单编码列表
const orderCodeList = ref([])
// 工厂列表
const factoryList = ref([])
// 表格数据源
const tableData = ref([])
//查询数据源
const queryData = reactive({
  factoryId: '', //订单类型
  styleName: '',  //搜索关键字--款号
  orderCodeId: '',   //订单编码Id
  limit: 10,  //商品个数
  pageSize: 5, //每页大小
  pageNum: 1, //页码
  totalNum: 0  //总条数
})



//获取款号列表
const getData =async () => {
  const res = await getStyleNumberListFn(queryData)
  if (res.code !== 200) {
    return ElMessage.error(res.message)
  }
  tableData.value = res.data.resultList
  queryData.totalNum = res.data.totalNum
}
getData()

//获取订单编码列表
const getOrderCodeList =async () => {
  const resOC = await getOrderCodeListFn()
  if (resOC.code !== 200) {
    return  ElMessage.error(resOC.message)
  }
  orderCodeList.value = resOC.data
}
getOrderCodeList()

//获取工厂列表
const getFactoryList =async () => {
  const resF = await getFactoryListFn()
  if (resF.code !== 200) {
    return  ElMessage.error(resF.message)
  }
  factoryList.value = resF.data
}
getFactoryList()


// 修改每页显示条数
const changeSize = (size) => {
  queryData.pageSize = size;
  // 重新查询
  getData()
}
// 修改当前页码
const changeCurrent = (num) => {
  queryData.pageNum = num;
  // 重新查询
  getData()
}

</script>

<style lang='less' scoped>
.el-card {
  margin-top: 20px;
  height: 100%;
}

.el-table {
  margin-top: 20px
}

.avatar {
  display: flex;
  align-items: center;

  .el-avatar {
    margin-right: 15px;
  }
}
.page1 {
  //position: absolute;
  //right: 0;
  //left: 0;
  // bottom: 350px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.select-width {
  width: 100%;
}
.avatar-uploader, .avatar-uploader .avatar{
  width: 178px;
  height: 178px;
  display: block;
  border: #f9f9f9;
}

.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
</style>