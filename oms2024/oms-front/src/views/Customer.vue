<template>
  <div>
    <el-card>
      <el-button type="primary" size="default" @click="openDialog">新增</el-button>

      <!-- 表格 -->
      <el-table border :data="tableData"  style="width: 100%;text-align: center">

        <el-table-column type="index" align="center"/>
        <el-table-column align="center" prop="customerName" label="客户名称" />
        <el-table-column align="center" prop="customerDesc" label="描述" />

        <el-table-column align="center" label="操作" >
          <template #default="scope">
            <div>
              <el-tooltip content="编辑" placement="top">
                <el-button type="warning" icon="Edit" size="small" @click="editCustomer(scope.row)"/>
              </el-tooltip>
              <el-tooltip content="删除" placement="top">
                <el-button type="danger" icon="Delete" size="small" @click="delCustomer(scope.row)"/>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>

      </el-table>

      <!--新增/编辑对话框-->
      <el-dialog v-model="dialogVisible" :title="titleVal" width="40%">

        <el-form ref="formDataRef" :model="formData" :rules="rules" label-width="120px" >
          <el-form-item label="客户名称" prop="customerName">
            <el-input  v-model="formData.customerName" clearable />
          </el-form-item>

          <el-form-item label="描述" prop="customerDesc">
            <el-input type="textarea" v-model="formData.customerDesc" />
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
//表格数据源
import {reactive, ref} from "vue";
import {ElMessage, ElMessageBox} from "element-plus";
import {addCustomerFn, delCustomerFn, editCustomerFn, getCustomerListFn} from "@/api/dic/customer.js";

const tableData = ref([])
// 显示或隐藏对话框
const dialogVisible = ref(false)
//对话框标题
const titleVal = ref('新增')
//获取表单dom元素
const formDataRef = ref()
//对话框表单数据源
const formData = reactive({
  customerName: '',
  customerDesc: ''
})
//要修改的客户id
const customerId = ref(0)

//对话框表单验证规则
const rules = reactive({
  customerName: [
    {required: true, message: "请输入客户名称！", trigger: "blur"},
  ]
})

// 打开新增对话框
const openDialog = () => {
  // 初始化表单
  titleVal.value = '新增'
  formData.customerName = ''
  formData.customerDesc = ''

  dialogVisible.value = true
}
//打开编辑对话框
const editCustomer = (row) => {
  //初始化表单
  titleVal.value = '编辑'

  customerId.value = row.customerId
  formData.customerName = row.customerName
  formData.customerDesc = row.customerDesc

  dialogVisible.value = true
}
//确认保存
const submitOk = () => {

  formDataRef.value.validate(async valid =>{
    if (!valid) {
      return  ElMessage.error('验证失败')
    }
    if (titleVal.value === '新增') {
      console.log(formData)
      const res = await addCustomerFn(formData)
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
      const res = await editCustomerFn(customerId.value,formData)
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

//删除客户信息
const delCustomer =async (row) => {
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

  const res = await delCustomerFn(row.customerId)
  // console.log(res)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  ElMessage({
    message: '删除成功！',
    type: 'success'
  })
  await getData()
}

//获取客户信息列表
const getData =async () => {
  const res = await getCustomerListFn()
  // console.log(res)
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