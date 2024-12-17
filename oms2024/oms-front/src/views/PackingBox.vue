<template>
  <div>
    <el-card>
      <el-button type="primary" size="default" @click="openDialog">新增</el-button>
      <!-- 表格 -->
      <el-table border height="880px" :data="tableData"  style="width: 100%;text-align: center">

        <el-table-column align="center" type="index"/>
        <el-table-column align="center" sortable prop="specification" label="包装箱规格" />
        <el-table-column align="center" label="长">
          <template #default="scope">
            {{scope.row.boxLength}} cm
          </template>
        </el-table-column>
        <el-table-column align="center" label="宽">
          <template #default="scope">
            {{scope.row.boxWidth}} cm
          </template>
        </el-table-column>
        <el-table-column align="center" label="高">
          <template #default="scope">
            {{scope.row.boxHigh}} cm
          </template>
        </el-table-column>
        <el-table-column align="center" label="容量">
          <template #default="scope">
            {{scope.row.volume}} 方
          </template>
        </el-table-column>
        <el-table-column align="center" prop="boxDesc" label="备注" />

        <el-table-column align="center" label="操作" >
          <template #default="scope">
            <div>
              <el-tooltip content="编辑" placement="top">
                <el-button type="warning" icon="Edit" size="small" @click="editPackingBox(scope.row)"/>
              </el-tooltip>
              <el-tooltip content="删除" placement="top">
                <el-button type="danger" icon="Delete" size="small" @click="delPackingBox(scope.row)"/>
              </el-tooltip>
            </div>
          </template>
        </el-table-column>

      </el-table>

      <!--新增/编辑对话框-->
      <el-dialog v-model="dialogVisible" :title="titleVal" width="20%">

        <el-form ref="formDataRef" :model="formData" :rules="rules" label-width="120px" >

          <el-form-item label="长：" prop="boxLength">
            <el-input style="width: 150px" :precision="2" :step="0.01" type="number" v-model="formData.boxLength" >
              <template #append>厘米</template>
            </el-input>
          </el-form-item>

          <el-form-item label="宽：" prop="boxWidth">
            <el-input style="width: 150px" :precision="2" :step="0.01" type="number" v-model="formData.boxWidth" >
              <template #append>厘米</template>
            </el-input>
          </el-form-item>

          <el-form-item label="高：" prop="boxHigh">
            <el-input style="width: 150px" :precision="2" :step="0.01" type="number" v-model="formData.boxHigh" >
              <template #append>厘米</template>
            </el-input>
          </el-form-item>

          <el-form-item label="备注:" prop="boxDesc">
            <el-input style="width: 240px" type="textarea" v-model="formData.boxDesc" />
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
import {addPackingBoxFn, delPackingBoxFn, editPackingBoxFn, getPackingBoxListFn} from "@/api/dic/packingBox.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {editFactoryFn} from "@/api/dic/factory.js";

const tableData = ref([])
// 显示或隐藏对话框
const dialogVisible = ref(false)
//对话框标题
const titleVal = ref('新增')
//获取表单dom元素
const formDataRef = ref()
//对话框表单数据源
const formData = reactive({
  boxLength: '',
  boxWidth: '',
  boxHigh: '',
  boxDesc: ''
})
//要修改的包装箱id
const packingBoxId = ref(0)

//对话框表单验证规则
const rules = reactive({
  boxLength: [
    {required: true, message: "请输入包装箱的长！", trigger: "blur"},
  ],
  boxWidth: [
    {required: true, message: "请输入包装箱的长！", trigger: "blur"},
  ],
  boxHigh: [
    {required: true, message: "请输入包装箱的长！", trigger: "blur"},
  ],
})

// 打开新增对话框
const openDialog = () => {
  // 初始化表单
  titleVal.value = '新增'

  formData.boxLength = ''
  formData.boxWidth = ''
  formData.boxHigh = ''
  formData.boxDesc = ''

  dialogVisible.value = true
}
//打开编辑对话框
const editPackingBox = (row) => {
  // 初始化表单
  titleVal.value = '编辑'

  packingBoxId.value = row.packingBoxId
  formData.boxLength = row.boxLength
  formData.boxWidth = row.boxWidth
  formData.boxHigh = row.boxHigh
  formData.boxDesc = row.boxDesc

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
      const res = await addPackingBoxFn(formData)
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
      const res = await editPackingBoxFn(packingBoxId.value,formData)
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

//删除包装箱信息
const delPackingBox =async (row) => {
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

  const res = await delPackingBoxFn(row.packingBoxId)
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

//获取包装箱信息列表
const getData =async () => {
  const res = await getPackingBoxListFn()
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