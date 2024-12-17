<template>
  <div>
    <el-card style="height:100%">

      <el-tabs v-model="queryData.factoryId" @tab-change="getData">
        <el-tab-pane label="全部" name=""></el-tab-pane>
        <el-tab-pane v-for="fact in factoryList" :label="fact.factoryCode" :name="fact.factoryId"></el-tab-pane>
      </el-tabs>
      <el-tabs v-model="queryData.customerId" @tab-change="getData">
        <el-tab-pane label="全部" name=""></el-tab-pane>
        <el-tab-pane v-for="cus in customerList" :label="cus.customerName" :name="cus.customerId"></el-tab-pane>
      </el-tabs>

      <el-row :gutter="20">
        <el-col  :span="8">
          <el-input v-model="queryData.styleName" placeholder="请输入款号" clearable @clear="getData">
            <template #prepend>
                <el-row :gutter="30">
                  <el-col :span="12">
                    <el-select style="width: 180px" v-model="queryData.orderCodeId" placeholder="请选择订单编码" clearable @clear="getData">
                      <el-option v-for="item in orderCodeList" :key="item.orderCodeId" :label="item.orderCodeName" :value="item.orderCodeId" >{{item.orderCodeName}}</el-option>
                    </el-select>
                  </el-col>
                  <el-col :span="12">
                    <el-select style="width: 180px" v-model="queryData.markId" placeholder="请选择唛头" clearable @clear="getData">
                      <el-option v-for="item in markList" :key="item.markId" :label="item.markName" :value="item.markId" >{{item.markName}}</el-option>
                    </el-select>
                  </el-col>
                </el-row>
            </template>

            <template #append>
              <el-button icon="Search" @click="getData" />
            </template>

          </el-input>
        </el-col>
        <el-button type="primary" @click="openExportExcelDialog">导出到Excel</el-button>
      </el-row>

      <!--订单信息列表-->
      <el-row style="height: 100%">
        <el-col>
          <el-table :data="tableData" style="width: 100%;">
            <el-table-column type="index" width="70" align="center"  label="序号" />
            <el-table-column align="center" prop="styleName"  label="款号"></el-table-column>
            <el-table-column prop="stylePrice"  align="center" label="单价（元/打）">
              <template #default="scope">
                <el-text type="danger">￥ </el-text>{{scope.row.stylePrice}}
              </template>
            </el-table-column>
            <el-table-column prop="markName" align="center" label="唛头"/>
            <el-table-column prop="orderNum" align="center" label="数量"/>
            <el-table-column prop="stock" align="center" label="库存"/>
            <el-table-column prop="totalPrice" align="center" label="总价" >
              <template #default="scope">
                <el-text type="danger">￥ </el-text>{{scope.row.totalPrice}}
              </template>
            </el-table-column>
            <el-table-column prop="factoryCode" align="center" sortable label="所属工厂"/>
            <el-table-column prop="customerName" align="center" sortable label="所属客户"/>
            <el-table-column prop="styleDesc" align="center" label="备注"/>
            <el-table-column align="center" label="操作">
              <template #default="scope">
                <el-button type="primary" icon="" size="default" @click="addShipmentInfo(scope.row)">添加到出货单</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-col>
      </el-row>
      <!-- 分页 -->
      <div class="page1">
        <el-pagination
            background
            :total="queryData.totalNum"
            :page-sizes="[5, 10, 15, 20, 25, 30,35,40,50,60,70,80,90,100]"
            v-model:page-size="queryData.pageSize"
            v-model:currentPage="queryData.pageNum"
            layout="total, sizes, prev, pager, next, jumper"
            style="margin-top: 20px;"
            @size-change="changeSize"
            @current-change="changeCurrent"
        />
      </div>

      <!--添加出库对话框-->
      <el-dialog v-model="dialogVisible" title="设置出货信息" width="20%">

        <el-form ref="formDataRef" :model="formData" :rules="rules" label-width="120px" >

          <el-form-item label="出货单编码：" prop="shipmentCodeId">
            <el-select v-model="formData.shipmentCodeId" filterable placeholder="出货单编码" size="default" style="width: 240px">
              <el-option
                  v-for="shipmentCode in shipmentCodeList"
                  :key="shipmentCode.shipmentCodeId"
                  :label="shipmentCode.shipmentCodeName"
                  :value="shipmentCode.shipmentCodeId"
              />
            </el-select>
          </el-form-item>

          <el-form-item label="款号：">{{styleName}}</el-form-item>

          <el-form-item label="唛头：">{{markName}}</el-form-item>

          <el-form-item label="单价：">{{stylePrice}} 元/打</el-form-item>

          <el-form-item label="库存：">{{stock}} 打</el-form-item>

          <el-form-item label="出货数量：" prop="shipmentNum">
            <el-input  style="width: 150px" type="number" v-model="formData.shipmentNum" :min="1">
              <template #append>打</template>
            </el-input>
          </el-form-item>

          <el-form-item label="包装箱规格：" prop="packingBoxId">
            <el-select v-model="formData.packingBoxId" filterable placeholder="选择包装箱规格" size="default" style="width: 240px">
              <el-option
                  v-for="packingBox in packingBoxList"
                  :key="packingBox.packingBoxId"
                  :label="packingBox.specification"
                  :value="packingBox.packingBoxId"
              />
            </el-select>
          </el-form-item>

          <el-form-item label="打/箱：" prop="dozPerBox">
            <el-input  style="width: 150px" v-model="formData.dozPerBox" :min="1" :max="100">
              <template #append>打</template>
            </el-input>
          </el-form-item>

          <el-form-item label="每箱净重：" prop="netWeight">
            <el-input style="width: 150px" :precision="2" :step="0.01" v-model="formData.netWeight" type="number">
              <template #append>千克</template>
            </el-input>
          </el-form-item>

          <el-form-item label="每箱毛重：" prop="grossWeight">
            <el-input style="width: 150px" :precision="2" :step="0.01" v-model="formData.grossWeight" type="number">
              <template #append>千克</template>
            </el-input>
          </el-form-item>

          <el-form-item label="尺码：" >
            <el-input style="width: 240px"  v-model="formData.tallas" />
          </el-form-item>

          <el-form-item label="备注：" >
            <el-input style="width: 240px" type="textarea" v-model="formData.shipmentDesc" />
          </el-form-item>
        </el-form>

        <template #footer>
          <div>
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button type="primary" @click="submitOk">
              确定
            </el-button>
          </div>
        </template>
      </el-dialog>
    </el-card>
  </div>
</template>

<script setup>

import {reactive, ref} from "vue";
import {ElMessage} from "element-plus";
import {getFactoryListFn} from "@/api/dic/factory.js";
import {getOrderCodeListFn} from "@/api/orderDic.js";
import {getCustomerListFn} from "@/api/dic/customer.js";
import {exportOrderToExcelFn, getOrderInfoListForPageFn} from "@/api/dic/orderNum.js";
import {getMarkListFn} from "@/api/dic/mark.js";
import {getShipmentCodeListFn} from "@/api/shipment/shipment.js";
import {addShipmentInfoFn} from "@/api/shipment/shipmentInfo.js";
import {getPackingBoxListFn} from "@/api/dic/packingBox.js";

//订单编码列表
const orderCodeList = ref([])
//唛头列表
const markList = ref([])
// 工厂列表
const factoryList = ref([])
// 客户列表
const customerList = ref([])
//包装箱列表
const packingBoxList = ref([])
// 表格数据源
const tableData = ref([])
//查询数据源
const queryData = reactive({
  factoryId: '', //工厂ID
  customerId: '', //客户ID
  styleName: '',  //搜索关键字--款号
  orderCodeId: '',   //订单编码Id
  markId: '',
  limit: 10,  //商品个数
  pageSize: 15, //每页大小
  pageNum: 1, //页码
  totalNum: 0  //总条数
})

//------出货添加对话框---------
//对话框显示与隐藏
const dialogVisible = ref(false)
//获取表单dom元素
const formDataRef = ref()
//出货单编码列表
const shipmentCodeList = ref([])
//款号
const styleName = ref('')
//唛头
const markName = ref('')
//单价
const stylePrice = ref(0)
//库存
const stock = ref(0)
//对话框表单数据源
const formData = reactive({
  orderId: 0,   //订单号
  shipmentNum: 0,  //出货数量
  shipmentDesc: '',  //描述
  shipmentCodeId: '', //出货单号id
  packingBoxId: '',  //包装箱id
  dozPerBox: 0,   //每箱多少打
  netWeight: 0,  //净重
  grossWeight: 0,  //毛重
  tallas: ''   //尺码

})
//对话框表单验证规则
const rules = reactive({
  grossWeight: [
    {required: true, message: "毛重不能为空！", trigger: "blur"},
  ],
  netWeight: [
    {required: true, message: "净重不能为空！", trigger: "blur"},
  ],
  dozPerBox: [
    {required: true, message: "请输入每箱多少打！", trigger: "blur"},
  ],
  packingBoxId: [
    {required: true, message: "请选择包装箱规格！", trigger: "blur"},
  ],
  shipmentNum: [
    {required: true, message: "请输入出货数量！", trigger: "blur"},
  ],
  shipmentCodeId: [
    {required: true, message: "请选择出货单编码！", trigger: "blur"},
  ]
})

// 批量导出到Excel
const openExportExcelDialog = () => {

  //向后端发送请求
  let iframe = document.createElement("iframe")
  iframe.src = "http://localhost:9999/oms/order/exportExcel?factoryId="
      + queryData.factoryId + "&customerId=" + queryData.customerId + "&styleName=" + queryData.styleName
      + "&orderCodeId=" + queryData.orderCodeId + "&markId=" + queryData.markId
  //iframe隐藏，在页面不显示
  iframe.style.display = "none"
  document.body.appendChild(iframe)
}

//打开出货单对话框
const addShipmentInfo = (row) => {
  //初始化数据
  styleName.value = row.styleName
  markName.value = row.markName
  stylePrice.value = row.stylePrice
  stock.value = row.stock
  formData.shipmentCodeId = ''
  formData.orderId = row.orderId
  formData.shipmentNum = 1
  formData.shipmentDesc = ''
  formData.packingBoxId = null
  formData.dozPerBox = null
  formData.netWeight = null
  formData.grossWeight = null
  formData.tallas = ''

  dialogVisible.value = true
}

//保存出货单
const submitOk = () => {
  formDataRef.value.validate(async valid =>{
    if (!valid) {
      return  ElMessage.error('验证失败')
    }

    if (formData.shipmentNum > stock.value) {
      return ElMessage.error('库存不足')
    }

    if (formData.dozPerBox === 0) {
      return ElMessage.error('打/箱-不能为零')
    }
    const res = await addShipmentInfoFn(formData)

    if (res.code !== 200) {
      return ElMessage.error(res.message)
    }
    ElMessage({
      message: '添加成功！',
      type: 'success'
    })

    dialogVisible.value =false

    await getData()
  })

}

//获取订单信息列表
const getData =async () => {
  const res = await getOrderInfoListForPageFn(queryData)
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

//获取唛头信息列表
const getMarkList =async () => {
  const resM = await getMarkListFn()
  if (resM.code !== 200) {
    return ElMessage.error(resM.message)
  }
  markList.value = resM.data
}
getMarkList()

//获取工厂列表
const getFactoryList =async () => {
  const resF = await getFactoryListFn()
  if (resF.code !== 200) {
    return  ElMessage.error(resF.message)
  }
  factoryList.value = resF.data
}
getFactoryList()

//获取客户列表
const getCustomerList =async () => {
  const resC = await getCustomerListFn()
  if (resC.code !== 200) {
    return  ElMessage.error(resC.message)
  }
  customerList.value = resC.data
}
getCustomerList()

//获取出货单编码列表
const getShipmentCodeList =async () => {
  const resS = await getShipmentCodeListFn()
  if (resS.code !== 200) {
    return  ElMessage.error(resS.message)
  }
  shipmentCodeList.value = resS.data
}
getShipmentCodeList()

//获取包装箱信息列表
const getPackingBoxList =async () => {
  const resP = await getPackingBoxListFn()
  if (resP.code !== 200) {
    return ElMessage.error(resP.message)
  }
  packingBoxList.value = resP.data
}
getPackingBoxList()

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