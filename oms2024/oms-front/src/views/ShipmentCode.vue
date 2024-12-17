<template>
  <div style="height: 100%;width: 100%">
    <el-card>
      <el-row :gutter="30">
        <el-col :span="8">
          <el-input v-model="queryData.shipmentCodeName" placeholder="请输入出货单号" clearable @clear="getData">
            <template #append>
              <el-button icon="Search" @click="getData" />
            </template>
          </el-input>
        </el-col>
        <el-col :span="8">
          <el-button  type="primary" @click="openDialog">新增出货单号</el-button>
        </el-col>
      </el-row>

      <!-- 表格 -->
      <el-table border :data="tableData"  style="width: 100%;text-align: center">
        <el-table-column align="center" type="index" label="" sortable/>
        <el-table-column align="center" prop="shipmentCodeName" label="出货单编码" />
        <el-table-column align="center" prop="shipmentDate" label="出货日期" sortable/>
        <el-table-column align="center" prop="shipmentTotalPrice" label="总价" />
        <el-table-column align="center" prop="shipmentCodeDesc" label="描述" />
        <el-table-column align="center" label="操作" >
          <template #default="scope">
            <div>
              <el-tooltip content="编辑" placement="top">
                <el-button type="warning" icon="Edit" size="small" @click="editShipmentCode(scope.row)"/>
              </el-tooltip>
              <el-tooltip content="删除" placement="top">
                <el-button type="danger" icon="Delete" size="small" @click="delShipmentCode(scope.row)"/>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>
      </el-table>

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


      <!--新增/编辑对话框-->
      <el-dialog v-model="dialogVisible" :title="titleVal" width="30%">

        <el-form ref="formDataRef" :model="formData" :rules="rules"  >
          <el-form-item label="出货单号" prop="shipmentCodeName">
            <el-input size="default" style="width: 200px" v-model="formData.shipmentCodeName" clearable />
          </el-form-item>
          <el-form-item label="出货日期" prop="shipmentDate">
            <el-date-picker
                v-model="formData.shipmentDate"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="选择日期"
            />
          </el-form-item>
          <el-form-item label="描述" prop="shipmentCodeDesc">
            <el-input style="width: 280px" type="textarea" v-model="formData.shipmentCodeDesc" />
          </el-form-item>
        </el-form>

        <template #footer>
          <div class="dialog-footer">
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
import {ElMessage, ElMessageBox} from "element-plus";
import {
  addShipmentCodeFn,
  delShipmentCodeFn,
  editShipmentCodeFn,
  getShipmentCodeListForPageFn
} from "@/api/shipment/shipment.js";

//表单数据
const tableData = ref([])

//查询数据
const queryData = reactive({
  shipmentCodeName: '',
  limit: 10,  //个数
  pageSize: 15, //每页大小
  pageNum: 1, //页码
  totalNum: 0  //总条数
})

// 显示或隐藏对话框
const dialogVisible = ref(false)
//对话框标题
const titleVal = ref('新增')
//获取表单dom元素
const formDataRef = ref()
//对话框表单数据源
const formData = reactive({
  shipmentCodeId: '',
  shipmentCodeName: '',
  shipmentDate: '',
  shipmentCodeDesc: '',
  shipmentTotalPrice: 0
})

//对话框表单验证规则
const rules = reactive({
  shipmentCodeName: [
    {required: true, message: "请输入出货单编码！", trigger: "blur"},
  ]
})

//打开新增对话框
const openDialog = () => {
  //初始化表单元素
  formData.shipmentCodeName = ''
  formData.shipmentDate = ''
  formData.shipmentCodeDesc = ''

  //显示对话框
  dialogVisible.value = true
}

//打开编辑对话框
const editShipmentCode = (row) => {
  //对话框标题
  titleVal.value = '编辑'

  //初始化表单元素
  formData.shipmentCodeId = row.shipmentCodeId
  formData.shipmentCodeName = row.shipmentCodeName
  formData.shipmentDate = row.shipmentDate
  formData.shipmentCodeDesc = row.shipmentCodeDesc

  //显示对话框
  dialogVisible.value = true
}

//确认保存
const submitOk = () => {
  formDataRef.value.validate(async valid =>{
    if (!valid) {
      return  ElMessage.error('验证失败')
    }
    if (titleVal.value === '新增') {
      const res = await addShipmentCodeFn(formData)
      if (res.code !== 200) {
        return ElMessage.error(res.message)
      }
      ElMessage({
        message: '添加成功！',
        type: 'success'
      })
      dialogVisible.value =false
      await getData()

    }else if (titleVal.value === '编辑'){
      const res = await editShipmentCodeFn(formData)
      if (res.code !== 200) {
        return ElMessage.error(res.message)
      }
      ElMessage({
        message: '修改成功！',
        type: 'success'
      })
      dialogVisible.value =false
      await getData()
    }
  })
}

//删除出货单编码
const delShipmentCode =async (row) => {
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

  const res = await delShipmentCodeFn(row.shipmentCodeId)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  ElMessage({
    message: '删除成功！',
    type: 'success'
  })
  await getData()
}

//获取列表
const getData =async () => {
  const res = await getShipmentCodeListForPageFn(queryData)
  if (res.code !== 200) {
    return ElMessage.error(res.message)
  }
  tableData.value = res.data.resultList
  queryData.totalNum = res.data.totalNum
}
getData()

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

<style scoped lang="less">
.el-card {
  margin-top: 20px;
  .el-table {
    margin-top: 20px;
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
</style>