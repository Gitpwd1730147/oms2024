<template>
  <div>
    <!--设置款号订单数量对话框-->
    <el-dialog  v-model="dialogVisible" title="设置订单数量" @close="close" destroy-on-close width="40%">
      <el-card style="width: 100%" shadow="always">
        <el-row>
          <el-col style="font-size: large;">
            款号:&nbsp;&nbsp;{{styleName}}
          </el-col>
        </el-row>
      </el-card>
        <el-form ref="formDataRef" :model="formData" :rules="rules" >
          <el-card style="width: 100%" shadow="always">
            <el-row :gutter="15">
              <el-col :span="6">
                <el-form-item  label="唛头" prop="markId">
                  <el-select v-model="formData.markId" placeholder="请选择唛头" size="large" clearable style="width: 240px">
                    <el-option v-for="item in markList" :key="item.markId" :label="item.markName" :value="item.markId"/>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="6">
                <el-form-item   label="数量" prop="orderNum">
                  <el-input-number v-model="formData.orderNum" :min="1" :max="30000"  />
                </el-form-item>
              </el-col>
              <el-col  v-if="flag ==='edit'" :span="6">
                <el-form-item   label="库存">
                  <el-input-number v-model="formData.stock" :min="1" :max="30000"  />
                </el-form-item>
              </el-col>
              <el-col :span="6">
                <el-form-item   label="备注" prop="orderDesc">
                 <el-input type="textarea" v-model="formData.orderDesc"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="6">
                <el-button v-if="flag ==='add'" type="primary" @click="addOrderNum">添加</el-button>
                <el-button  v-if="flag ==='edit'" type="primary" @click="saveEditOrderNum">保存修改</el-button>
                <el-button  v-if="flag ==='edit'" type="primary" @click="cancelEditOrderNum">取消</el-button>
              </el-col>
            </el-row>
            <el-card style="width: 100%" shadow="always">
              <el-row>
                <el-col style="text-align: center;font-size: medium">款号订单数量信息</el-col>
              </el-row>
              <el-row>
                <el-col>
                  <el-table :data="tableDataNum" border style="width: 100%">
                    <el-table-column align="center" prop="markName" label="唛头"  />
                    <el-table-column align="center" prop="orderNum" label="数量"  />
                    <el-table-column align="center" prop="stock" label="库存"  />
                    <el-table-column align="center" prop="orderDesc" label="备注"  />
                    <el-table-column align="center"  width="180"  label="操作" >
                      <template #default="scope">
                        <div>
                          <el-button type="warning" icon="Edit" size="small" @click="editOrderNum(scope.row)"/>
                          <el-button type="danger" icon="Delete" size="small" @click="delOrderNum(scope.row)"/>
                        </div>
                      </template>
                    </el-table-column>
                  </el-table>
                </el-col>
              </el-row>
            </el-card>
          </el-card>
        </el-form>

    </el-dialog>
  </div>
</template>

<script setup>
import {reactive, ref} from "vue";
import {getMarkListFn} from "@/api/dic/mark.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {addOrderNumFn, delOrderInfoFn, editOrderInfoFn, getOrderNumListFn} from "@/api/dic/orderNum.js";

//自定义事件调用父组件方法
const emit = defineEmits(["ok"])

// 新增或编辑的表示
const flag = ref('add')

//对话框隐藏/显示
const dialogVisible = ref(false)
//表单元素dom
const formDataRef = ref(null)
//表单数据源
const formData = reactive({
  markId: 10,
  orderNum: 1,
  orderDesc: '',
  stock: 1
})
// 对话框表单验证规则
const rules = reactive({
  markId: [
    {required: true, message: "请选择唛头", trigger: "blur"},
  ],
  orderNum: [
    {required: true, message: "请输入数量！", trigger: "blur"},
  ]
})

// 唛头列表
const markList = ref([])
// 表格数据源
const tableDataNum = ref([])

const styleName = ref('')
const styleId =ref(0)

//打开配比对话框
const open = (styleNumber) => {
  styleId.value = styleNumber.styleId
  styleName.value = styleNumber.styleName

  getMarkList()
  getDataNum()
  dialogVisible.value =true
}

// 新增订单数量
const addOrderNum = () => {
  formDataRef.value.validate(async valid =>{
    if (!valid) {
      return  ElMessage.error('验证失败')
    }
    let data = {
      styleId: styleId.value,
      markId: formData.markId,
      orderNum: formData.orderNum,
      orderDesc: formData.orderDesc
    }
    const res = await addOrderNumFn(data)
    if (res.code !== 200) {
      return ElMessage.error(res.message)
    }

    formData.markId = 1
    formData.orderNum = 1
    formData.orderDesc = ''

    ElMessage({
      message: '添加成功！',
      type: 'success'
    })
    emit('ok')
    await getDataNum()
})
}

//要修改的订单数量id
const orderId = ref(0)
//打开修改状态
const editOrderNum = (row) => {
  flag.value = 'edit'
  orderId.value = row.orderId
  formData.markId = row.markId
  formData.orderNum = row.orderNum
  formData.orderDesc = row.orderDesc
  formData.stock = row.stock
}
//取消修改状态
const cancelEditOrderNum = () => {
  flag.value = 'add'
  formData.markId = 1
  formData.orderNum = 1
  formData.orderDesc = ''
}
// 保存修改的尺码配比信息
const saveEditOrderNum = () => {
  formDataRef.value.validate(async valid => {
    if (!valid) {
      return ElMessage.error('验证失败')
    }
    const res = await editOrderInfoFn(orderId.value,formData)
    if (res.code !== 200) {
      return ElMessage.error(res.message)
    }

    formData.markId = 1
    formData.orderNum = 1
    formData.orderDesc = ''
    flag.value = 'add'

    ElMessage({
      message: '修改成功！',
      type: 'success'
    })
    emit('ok')
    await getDataNum()
  })
}
//删除尺码配比
const delOrderNum =async (row) => {
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

  const res = await delOrderInfoFn(row.orderId)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  ElMessage({
    message: '删除成功！',
    type: 'success'
  })
  emit('ok')
  await getDataNum()
}

//获取唛头列表
const getMarkList =async () => {
  const res = await getMarkListFn()
  // console.log(res)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  markList.value = res.data
}

//获取此款号订单数量信息列表
const getDataNum =async () => {
  const res = await getOrderNumListFn(styleId.value)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  tableDataNum.value = res.data
}

//关闭对话框
const close = () => {
  //清空表单元素
  styleId.value = 0

  formData.markId = 10
  formData.orderNum = 1
  flag.value = 'add'

  dialogVisible.value = false
}

defineExpose({open})
</script>

<style scoped lang="less">

</style>