<template>
  <div>
    <el-card>
      <el-button type="primary" size="default" @click="openDialog">新增</el-button>
      <!-- 表格 -->
      <el-table border :data="tableData"  style="width: 100%;text-align: center">

        <el-table-column align="center" type="index"/>
        <el-table-column align="center" prop="markName" label="唛头名称" />
        <el-table-column align="center" sortable prop="customerName" label="所属客户" />
        <el-table-column align="center" prop="markDesc" label="备注" />

        <el-table-column align="center" label="操作" >
          <template #default="scope">
            <div>
              <el-tooltip content="编辑" placement="top">
                <el-button type="warning" icon="Edit" size="small" @click="editMark(scope.row)"/>
              </el-tooltip>
              <el-tooltip content="删除" placement="top">
                <el-button type="danger" icon="Delete" size="small" @click="delMark(scope.row)"/>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>

      </el-table>

      <!--新增/编辑对话框-->
      <el-dialog v-model="dialogVisible" :title="titleVal" width="40%">

        <el-form ref="formDataRef" :model="formData" :rules="rules" label-width="120px" >

          <el-form-item label="唛头名称" prop="markName">
            <el-input  v-model="formData.markName" clearable />
          </el-form-item>

          <el-form-item label="所属客户" prop="customerId">
            <el-select v-model="formData.customerId" placeholder="所属客户" size="large" style="width: 240px">
              <el-option
                  v-for="customer in customerList"
                  :key="customer.customerId"
                  :label="customer.customerName"
                  :value="customer.customerId"

              />
            </el-select>
          </el-form-item>

          <el-form-item label="备注" prop="markDesc">
            <el-input type="textarea" v-model="formData.markDesc" />
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
import {getCustomerListFn} from "@/api/dic/customer.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {addMarkFn, delMarkFn, editMarkFn, getMarkListFn} from "@/api/dic/mark.js";

const tableData = ref([])
// 显示或隐藏对话框
const dialogVisible = ref(false)
//对话框标题
const titleVal = ref('新增')
//获取表单dom元素
const formDataRef = ref()
//对话框表单数据源
const formData = reactive({
  markName: '',
  markDesc: '',
  customerId: ''
})
//要修改的唛头id
const markId = ref(0)
//客户信息列表
const customerList = ref([])

//对话框表单验证规则
const rules = reactive({
  markName: [
    {required: true, message: "请输入唛头名称！", trigger: "blur"},
  ],
  customerId: [
    {required: true, message: "请选择所属客户！", trigger: "blur"},
  ]
})

// 打开新增对话框
const openDialog = () => {
  // 初始化表单
  titleVal.value = '新增'
  formData.markName = ''
  formData.markDesc = ''
  formData.customerId = ''

  dialogVisible.value = true
}
//打开编辑对话框
const editMark = (row) => {
  //初始化表单
  titleVal.value = '编辑'

  markId.value = row.markId
  formData.markName = row.markName
  formData.markDesc = row.markDesc
  formData.customerId = row.customerId

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
      const res = await addMarkFn(formData)
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
      const res = await editMarkFn(markId.value,formData)
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

//删除唛头信息
const delMark =async (row) => {
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

  const res = await delMarkFn(row.markId)
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

// 获取唛头列表
const getData =async () => {
  const res = await getMarkListFn()
  // console.log(res)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  tableData.value = res.data
}
getData()


//获取客户列表
const getCustomerList =async () => {
  const res = await getCustomerListFn()
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  customerList.value = res.data
}
getCustomerList()

</script>

<style lang='less' scoped>
.el-card {
  margin-top: 20px;

  .el-table {
    margin-top: 20px;
  }
}
</style>