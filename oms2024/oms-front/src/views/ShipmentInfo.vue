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

      <el-row :gutter="30">
        <el-col  :span="8">
          <el-input v-model="queryData.styleName" placeholder="请输入款号" clearable @clear="getData">
            <template #prepend>
              <el-row :gutter="30">
                <el-col :span="12">
                  <el-select @change="getData"  style="width: 180px" v-model="queryData.shipmentCodeId" placeholder="请选择出货单编码" clearable @clear="getData">
                    <el-option  v-for="item in shipmentCodeList" :key="item.shipmentCodeId" :label="item.shipmentCodeName" :value="item.shipmentCodeId" >{{item.shipmentCodeName}}</el-option>
                  </el-select>
                </el-col>
                <el-col :span="12">
                  <el-select @change="getData" style="width: 180px" v-model="queryData.markId" placeholder="请选择唛头" clearable @clear="getData">
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

        <el-button type="primary" @click="openImportExcelDialog">从Excel批量导入</el-button>
        <el-button type="primary" @click="openExportExcelDialog">导出到Excel</el-button>
      </el-row>

      <!--出货单信息列表-->
      <el-row style="height: 100%">
        <el-col>
          <el-table :data="tableData" height="730" style="width: 100%;" :summary-method="getSummaries" show-summary>
<!--            <el-table-column type="selection"  align="center"  label="序号" />-->
            <el-table-column prop="shipmentCodeName" align="center" label="出货单编码"/>
            <el-table-column align="center" prop="styleName"  label="款号"></el-table-column>
            <el-table-column prop="markName" align="center" label="唛头"/>
<!--            <el-table-column prop="stock" align="center" label="库存"/>-->
            <el-table-column prop="stylePrice"  align="center" label="单价（元/打）">
              <template #default="scope">
                <el-text type="danger">￥ </el-text>{{scope.row.stylePrice}}
              </template>
            </el-table-column>

            <el-table-column  prop="shipmentNum" align="center" label="出货数量">
              <template #default="scope">
                <el-text type="danger">{{scope.row.shipmentNum}} 打 </el-text>
              </template>
            </el-table-column>

            <el-table-column prop="totalPrice" align="center" label="总价" >
              <template #default="scope">
                <el-text type="danger">￥ </el-text>{{scope.row.totalPrice}}
              </template>
            </el-table-column>
            <el-table-column prop="dozPerBox" align="center"  label="打/箱">
              <template #default="scope">
                {{scope.row.dozPerBox}}  <el-text type="danger">打 </el-text>
              </template>
            </el-table-column>
            <el-table-column  align="center"  label="总箱数">
              <template #default="scope">
                {{scope.row.totalBoxNum}}  <el-text type="danger">箱 </el-text>
              </template>
            </el-table-column>
            <el-table-column  align="center"  label="箱规">
              <el-table-column prop="boxLength" align="center"  label="长">
                <template #default="scope">
                  {{scope.row.boxLength}}  <el-text type="danger">cm</el-text>
                </template>
              </el-table-column>
              <el-table-column prop="boxWidth" align="center"  label="宽">
                <template #default="scope">
                  {{scope.row.boxWidth}}  <el-text type="danger">cm</el-text>
                </template>
              </el-table-column>
              <el-table-column prop="boxHigh" align="center"  label="高">
                <template #default="scope">
                  {{scope.row.boxHigh}}  <el-text type="danger">cm</el-text>
                </template>
              </el-table-column>
            </el-table-column>

            <el-table-column prop="volume" align="center"  label="容量">
              <template #default="scope">
                {{scope.row.volume}}  <el-text type="danger">方</el-text>
              </template>
            </el-table-column>
            <el-table-column prop="totalCbm" align="center"  label="总立方">
              <template #default="scope">
                {{scope.row.totalCbm}}  <el-text type="danger">方</el-text>
              </template>
            </el-table-column>
            <el-table-column prop="netWeight" align="center"  label="每箱净重">
              <template #default="scope">
                {{scope.row.netWeight}}  <el-text type="danger">kg</el-text>
              </template>
            </el-table-column>
            <el-table-column prop="totalNetWeight" align="center"  label="总净重">
              <template #default="scope">
                {{scope.row.totalNetWeight}}  <el-text type="danger">kg</el-text>
              </template>
            </el-table-column>
            <el-table-column prop="grossWeight" align="center"  label="每箱毛重">
              <template #default="scope">
                {{scope.row.grossWeight}}  <el-text type="danger">kg</el-text>
              </template>
            </el-table-column>
            <el-table-column prop="totalGrossWeight" align="center"  label="总毛重">
              <template #default="scope">
                {{scope.row.totalGrossWeight}}  <el-text type="danger">kg</el-text>
              </template>
            </el-table-column>

            <el-table-column prop="tallas" align="center" label="尺码"/>
            <el-table-column prop="shipmentDesc" align="center" label="备注"/>
            <el-table-column align="center" label="操作">
              <template #default="scope">
                <div>
                  <el-tooltip content="编辑" placement="top">
                    <el-button type="warning" icon="Edit" size="small" @click="editShipmentInfo(scope.row)"/>
                  </el-tooltip>
                  <el-tooltip content="删除" placement="top">
                    <el-button type="danger" icon="Delete" size="small" @click="delShipmentInfo(scope.row)"/>
                  </el-tooltip>
                </div>
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
            :page-sizes="[10,20,30,40,50,60,70,80,90,100,120,140,160,180,200]"
            v-model:page-size="queryData.pageSize"
            v-model:currentPage="queryData.pageNum"
            layout="total, sizes, prev, pager, next, jumper"
            style="margin-top: 20px;"
            @size-change="changeSize"
            @current-change="changeCurrent"
        />
      </div>

      <!--Excel导入对话框-->
      <el-dialog v-model="importExcelDialogVisible" title="Excel批量导入" width="40%">
        <el-form-item label="出货单编码：" prop="shipmentCodeId">
          <el-select v-model="shipmentCodeIdStr" filterable placeholder="出货单编码" size="default" style="width: 240px">
            <el-option
                v-for="shipmentCode in shipmentCodeList"
                :key="shipmentCode.shipmentCodeId"
                :label="shipmentCode.shipmentCodeName"
                :value="shipmentCode.shipmentCodeId"
            />
          </el-select>
        </el-form-item>
        <el-upload
            ref="uploadRef"
            method="post"
            :http-request="uploadFile"
            :auto-upload="false"
        >
          <template #trigger>
            <el-button type="primary">选择Excel文件</el-button>
          </template>
          仅支持后缀名为.xls或者.xlsx的文件

          <template #tip>
            <div class="fileTip">
              重要提示：
              <ul>
                <li>上传仅支持后缀名为.xls或者.xlsx的文件</li>
                <li>给定Excel文件的第一行将视为字段名</li>
                <li>请确认你的文件大小不超过50MB</li>
                <li>日期值以文本形式保存，必须符合yyyy-MM-dd格式</li>
                <li>日期时间以文本形式保存，必须符合yyyy-MM-dd HH:mm:ss的格式</li>

              </ul>
            </div>
          </template>
        </el-upload>

        <template #footer>
          <div class="dialog-footer">
            <el-button @click="importExcelDialogVisible = false">取消</el-button>
            <el-button type="primary" @click="importExcel">
              导入
            </el-button>
          </div>
        </template>
      </el-dialog>

      <!--修改出库信息对话框-->
      <el-dialog v-model="dialogVisible" title="修改出货信息" width="20%">

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

          <el-form-item label="库存：">{{stock}}  打</el-form-item>

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
import {getMarkListFn} from "@/api/dic/mark.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {getFactoryListFn} from "@/api/dic/factory.js";
import {getCustomerListFn} from "@/api/dic/customer.js";
import {getShipmentCodeListFn} from "@/api/shipment/shipment.js";
import {
  delShipmentInfoFn,
  editShipmentInfoFn,
  getShipmentInfoForPage,
  importExcelForShipmentFn
} from "@/api/shipment/shipmentInfo.js";
import {getPackingBoxListFn} from "@/api/dic/packingBox.js";

//出货单编码列表
const shipmentCodeList = ref([])
//唛头列表
const markList = ref([])
// 工厂列表
const factoryList = ref([])
// 客户列表
const customerList = ref([])
//包装箱规格信息列表
const packingBoxList = ref([])
// 表格数据源
const tableData = ref([])
//查询数据源
const queryData = reactive({
  factoryId: '', //工厂ID
  customerId: '', //客户ID
  styleName: '',  //搜索关键字--款号
  shipmentCodeId: '',   //出货单编码Id
  markId: '',
  limit: 10,  //商品个数
  pageSize: 20, //每页大小
  pageNum: 1, //页码
  totalNum: 0  //总条数
})

//-------- 修改出库信息对话框--------
//显示隐藏对话框
const dialogVisible = ref(false)
//获取表单dom元素
const formDataRef = ref(null)
//款号
const styleName = ref('')
// 单价
const stylePrice = ref(0)
//唛头
const markName = ref('')
//库存
const stock = ref(0)
//原来出货数量
const oldShipmentNum = ref(0)
//对话框表单数据源
const formData = reactive({
  shipmentId: 0,
  orderId: 0,
  shipmentNum: 0,
  shipmentDesc: '',
  shipmentCodeId: '',
  packingBoxId: '',  //包装箱id
  dozPerBox: 0,   //每箱多少打
  netWeight: 0,  //净重
  grossWeight: 0,  //毛重
  tallas: ''   //尺码
})
//对话框表单验证规则
const rules = reactive({
  shipmentNum: [
    {required: true, message: "请输入出货数量！", trigger: "blur"},
  ],
  shipmentCodeId: [
    {required: true, message: "请选择出货单编码！", trigger: "blur"},
  ]
})

// Excel导入对话框显示与隐藏
const importExcelDialogVisible = ref(false)
//
const shipmentCodeIdStr =ref()
//上传组件dom
const uploadRef = ref()
// 打开从Excel批量导入对话框
const openImportExcelDialog = () => {
  importExcelDialogVisible.value = true
}
// 上传文件真正提交请求
const uploadFile =async (param) => {
  console.log(param)
  let fileObj = param.file
  let formData = new FormData()
  formData.append('file',fileObj)
  formData.append('shipmentCodeId',shipmentCodeIdStr.value)

  const res = await importExcelForShipmentFn(formData)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  ElMessage({
    message: '导入成功！',
    type: 'success'
  })
  uploadRef.value.clearFiles()
  importExcelDialogVisible.value = false
  await getData()
}
// 导入提交
const importExcel = () => {
  uploadRef.value.submit()
}



// 批量导出到Excel
const openExportExcelDialog = () => {
  //向后端发送请求
  let iframe = document.createElement("iframe")
  iframe.src = "http://localhost:9999/oms/shipment/exportExcel?factoryId="
      + queryData.factoryId + "&customerId=" + queryData.customerId + "&styleName=" + queryData.styleName
      + "&shipmentCodeId=" + queryData.shipmentCodeId + "&markId=" + queryData.markId
  //iframe隐藏，在页面不显示
  iframe.style.display = "none"
  document.body.appendChild(iframe)
}

//打开编辑出货信息对话框
const editShipmentInfo = (row) => {
  //初始化数据
  formData.shipmentId = row.shipmentId
  formData.orderId = row.orderId
  formData.shipmentNum = row.shipmentNum
  formData.shipmentDesc = row.shipmentDesc
  formData.shipmentCodeId = row.shipmentCodeId
  formData.packingBoxId = row.packingBoxId
  formData.dozPerBox = row.dozPerBox
  formData.netWeight = row.netWeight
  formData.grossWeight = row.grossWeight
  formData.tallas = row.tallas

  styleName.value = row.styleName
  stylePrice.value = row.stylePrice
  markName.value = row.markName
  stock.value = row.stock
  oldShipmentNum.value = row.shipmentNum

  //显示对话框
  dialogVisible.value = true
}
//保存修改
const submitOk = () => {
  formDataRef.value.validate(async valid =>{
    if (!valid) {
      return  ElMessage.error('验证失败')
    }
    //验证出货量是否大于库存
    if (formData.shipmentNum > (stock.value + oldShipmentNum.value)) {
      return ElMessage.error('库存不足')
    }

    const res = await editShipmentInfoFn(formData)
    if (res.code !== 200) {
      return ElMessage.error(res.message)
    }
    ElMessage({
      message: '修改成功！',
      type: 'success'
    })

    dialogVisible.value =false

    await getData()

  })
}


//删除出货信息
const delShipmentInfo =async (row) => {
  const isDel = await ElMessageBox.confirm(
      '是否删除？',
      '提示',
      {
        confirmButtonText:'确定',
        cancelButtonText:'取消',
        type:'warning'
      }
  ).catch(error=>error)
  if (isDel !== 'confirm') {
    return
  }

  const res = await delShipmentInfoFn(row.shipmentId)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  ElMessage({
    message: '删除成功！',
    type: 'success'
  })
  await getData()
}


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

//获取出货单信息列表
const getData =async () => {
  const res = await getShipmentInfoForPage(queryData)
  if (res.code !== 200) {
    return ElMessage.error(res.message)
  }
  tableData.value = res.data.resultList
  queryData.totalNum = res.data.totalNum
}
getData()

//表位合计行
const getSummaries = (param) => {
      const { columns, data } = param;
      const sums = [];
      columns.forEach((column, index) => {
        if (index === 3) {
          sums[index] = '合计';
          return;
        }
        if (index === 10 || index === 6 || index === 9 || index === 8 || index === 11 || index === 13 || index === 15 || index === 17 || index === 18) {
          sums[index] = '';
          return;
        }
        const values = data.map(item => Number(item[column.property]));
        if (!values.every(value => isNaN(value))) {
          sums[index] = values.reduce((prev, curr) => {
            const value = Number(curr);
            if (!isNaN(value)) {
              return prev + curr;
            } else {
              return prev;
            }
          }, 0);
          if (index === 4) {
            sums[index] = sums[index] + " 打";
          }
          if (index === 5 || index === 7) {
            sums[index] = '￥' + sums[index].toFixed(2);
          }
          if (index === 12) {
            sums[index] = sums[index].toFixed(4) + " 方";
          }
          if (index === 14 || index === 16) {
            sums[index] = sums[index].toFixed(2) + " kg";
          }
          sums[index] += ' ';
        } else {
          sums[index] = '';
        }
      });
      return sums;
    }


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
.fileTip {
  margin-top: 15px;
  font-family: 微软雅黑,serif;
  color: red;
}
</style>