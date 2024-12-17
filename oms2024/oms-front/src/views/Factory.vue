<template>
  <div>
    <el-card>
      <el-button type="primary" size="default" @click="openDialog">新增</el-button>
      <!-- 表格 -->
      <el-table border :data="tableData"  style="width: 100%;text-align: center">

        <el-table-column align="center" type="index"/>
        <el-table-column align="center" prop="factoryCode" label="工厂编码" />
        <el-table-column align="center" prop="factoryName" label="工厂名称" />
        <el-table-column align="center" prop="factoryBankNo" label="银行账号" />
        <el-table-column align="center" prop="factoryContact" label="联系方式" />
        <el-table-column align="center" prop="factoryDesc" label="备注" />

        <el-table-column align="center" label="操作" >
          <template #default="scope">
            <div>
              <el-tooltip content="编辑" placement="top">
                <el-button type="warning" icon="Edit" size="small" @click="editFactory(scope.row)"/>
              </el-tooltip>
              <el-tooltip content="删除" placement="top">
                <el-button type="danger" icon="Delete" size="small" @click="delFactory(scope.row)"/>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>

      </el-table>

      <!--新增/编辑对话框-->
      <el-dialog v-model="dialogVisible" :title="titleVal" width="40%">

        <el-form ref="formDataRef" :model="formData" :rules="rules" label-width="120px" >

          <el-form-item label="工厂编码" prop="factoryCode">
            <el-input  v-model="formData.factoryCode" clearable />
          </el-form-item>

          <el-form-item label="工厂名称" prop="factoryName">
            <el-input  v-model="formData.factoryName" clearable />
          </el-form-item>

          <el-form-item label="联系方式" prop="factoryContact">
            <el-input  v-model="formData.factoryContact" clearable />
         </el-form-item>

          <el-form-item label="银行账号" prop="factoryBankNo">
            <el-input type="textarea" v-model="formData.factoryBankNo" />
          </el-form-item>

          <el-form-item label="备注" prop="factoryDesc">
            <el-input type="textarea" v-model="formData.factoryDesc" />
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
import {addFactoryFn, delFactoryFn, editFactoryFn, getFactoryListFn} from "@/api/dic/factory.js";

const tableData = ref([])
// 显示或隐藏对话框
const dialogVisible = ref(false)
//对话框标题
const titleVal = ref('新增')
//获取表单dom元素
const formDataRef = ref()
//对话框表单数据源
const formData = reactive({
  factoryCode: '',
  factoryName: '',
  factoryBankNo: '',
  factoryContact: '',
  factoryDesc: ''
})
//要修改的工厂id
const factoryId = ref(0)

//对话框表单验证规则
const rules = reactive({
  factoryCode: [
    {required: true, message: "请输入工厂编码！", trigger: "blur"},
  ]
})

// 打开新增对话框
const openDialog = () => {
  // 初始化表单
  titleVal.value = '新增'

  formData.factoryCode = ''
  formData.factoryName = ''
  formData.factoryBankNo = ''
  formData.factoryContact = ''
  formData.factoryDesc = ''

  dialogVisible.value = true
}
//打开编辑对话框
const editFactory = (row) => {
  //初始化表单
  titleVal.value = '编辑'

  factoryId.value = row.factoryId
  formData.factoryCode = row.factoryCode
  formData.factoryName = row.factoryName
  formData.factoryBankNo = row.factoryBankNo
  formData.factoryContact = row.factoryContact
  formData.factoryDesc = row.factoryDesc

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
      const res = await addFactoryFn(formData)
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
      const res = await editFactoryFn(factoryId.value,formData)
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

//删除工厂信息
const delFactory =async (row) => {
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

  const res = await delFactoryFn(row.factoryId)
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

//获取工厂信息列表
const getData =async () => {
  const res = await getFactoryListFn()
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