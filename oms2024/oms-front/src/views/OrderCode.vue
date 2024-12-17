<template>
  <div style="height: 100%;width: 100%">
    <el-card>
      <el-button type="primary" size="default" @click="openDialog">新增</el-button>

      <!-- 表格 -->
      <el-table border :data="tableData"  style="width: 100%;text-align: center">
        <el-table-column align="center" type="index" label="" sortable/>
        <el-table-column align="center" prop="orderCodeName" label="订单编码" />
        <el-table-column align="center" prop="createDate" label="创建日期" sortable/>
        <el-table-column align="center" prop="orderCodeDesc" label="描述" />

        <el-table-column align="center" label="操作" >
          <template #default="scope">
            <div>
              <el-tooltip content="编辑" placement="top">
                <el-button type="warning" icon="Edit" size="small" @click="editOrderCode(scope.row)"/>
              </el-tooltip>
              <el-tooltip content="删除" placement="top">
                <el-button type="danger" icon="Delete" size="small" @click="delOrderCode(scope.row)"/>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>

      </el-table>

      <!--新增/编辑对话框-->
      <el-dialog v-model="dialogVisible" :title="titleVal" width="40%">

        <el-form ref="formDataRef" :model="formData" :rules="rules" label-width="120px" >
          <el-form-item label="订单编码" prop="orderCodeName">
            <el-input  v-model="formData.orderCodeName" clearable />
          </el-form-item>
          <el-form-item label="创建时间" prop="createDate">
            <el-date-picker
                v-model="formData.createDate"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="选择日期"
            />
          </el-form-item>
          <el-form-item label="描述" prop="orderCodeDesc">
            <el-input type="textarea" v-model="formData.orderCodeDesc" />
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
import {addOrderCodeFn, delOrderCodeFn, editOrderCodeFn, getOrderCodeListFn} from "@/api/orderDic.js";
import {ElMessage, ElMessageBox} from "element-plus";

//表格数据源
const tableData = ref([])
// 显示或隐藏对话框
const dialogVisible = ref(false)
//对话框标题
const titleVal = ref('新增')
//获取表单dom元素
const formDataRef = ref()
//对话框表单数据源
const formData = reactive({
  orderCodeId: '',
  orderCodeName: '',
  orderCodeDesc: '',
  createDate: ''
})

//对话框表单验证规则
const rules = reactive({
  orderCodeName: [
    {required: true, message: "请输入订单编码！", trigger: "blur"},
  ]
})

// 打开新增对话框
const openDialog = () => {
  // 初始化表单
  titleVal.value = '新增'
  
  formData.orderCodeName = ''
  formData.orderCodeDesc = ''
  formData.createDate = ''
  dialogVisible.value = true
}
//打开编辑对话框
const editOrderCode = (row) => {
  //初始化表单
  titleVal.value = '编辑'

  formData.orderCodeId = row.orderCodeId
  formData.orderCodeName = row.orderCodeName
  formData.orderCodeDesc = row.orderCodeDesc
  formData.createDate = row.createDate

  dialogVisible.value = true
}
//确认保存
const submitOk = () => {

  formDataRef.value.validate(async valid =>{
    if (!valid) {
      return  ElMessage.error('验证失败')
    }
    if (titleVal.value === '新增') {
      const res = await addOrderCodeFn(formData)
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
      const res = await editOrderCodeFn(formData)
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

//删除订单编码
const delOrderCode =async (row) => {
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

  const res = await delOrderCodeFn(row.orderCodeId)
  console.log(res)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  ElMessage({
    message: '删除成功！',
    type: 'success'
  })
  await getData()
}

  //获取订单编码
  const getData =async () => {
    const res = await getOrderCodeListFn()
    if (res.code !== 200) {
      return  ElMessage.error(res.message)
    }
  tableData.value = res.data
}
getData()
</script>

<style lang='less' scoped>
.el-card {
  margin-top: 20px;
  .el-table {
    margin-top: 20px;
  }
}
</style>