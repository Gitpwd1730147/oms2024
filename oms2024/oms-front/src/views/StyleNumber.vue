<template>
  <div>
    <el-card style="height:100%">
      <el-tabs v-model="queryData.factoryId" @tab-change="getData">
        <el-tab-pane label="全部" name=""></el-tab-pane>
        <el-tab-pane v-for="fact in factoryList" :label="fact.factoryCode" :name="fact.factoryId"></el-tab-pane>
      </el-tabs>

      <el-row :gutter="30">
        <el-col :span="8">
          <el-input v-model="queryData.styleName" placeholder="请输入款号" clearable @clear="getData">
            <template #prepend>
              <el-select style="width: 180px" v-model="queryData.orderCodeId" placeholder="请选择订单编码" clearable
                         @clear="getData">
                <el-option v-for="item in orderCodeList" :key="item.orderCodeId" :label="item.orderCodeName"
                           :value="item.orderCodeId">{{ item.orderCodeName }}
                </el-option>
              </el-select>
            </template>

            <template #append>
              <el-button icon="Search" @click="getData"/>
            </template>
          </el-input>
        </el-col>
        <el-col :span="8">
          <el-button type="primary" @click="openDialog">新增款号</el-button>

          <el-button type="primary" @click="openImportExcelDialog">批量导入（Excel）</el-button>
          <el-button type="primary" @click="openExportExcelDialog">批量导出（Excel）</el-button>
        </el-col>
      </el-row>

      <!--款号列表-->
      <el-row style="height: 100%">
        <el-col>
          <el-table :data="tableData" style="width: 100%;">
            <el-table-column type="expand">
              <template #default="props">
                <el-row style="background: #f9f9f9" :gutter="50">
                  <el-col :span="4">
                    <el-divider>颜色配比图</el-divider>
                    <div style="text-align: center">
                      <el-image
                          :preview-src-list="['http://localhost:9999/oms' + props.row.styleColorImg]"
                          style="width: 100px; height: 100px"
                          :src="'http://localhost:9999/oms' + props.row.styleColorImg"
                          fit="fill"
                          hide-on-click-modal
                          preview-teleported
                      />
                    </div>
                  </el-col>

                  <el-col :span="6">
                    <el-divider>颜色配比</el-divider>
                    <el-table stripe border :data="props.row.styleColorList">
                      <el-table-column align="center" label="颜色" prop="colorName"/>
                      <el-table-column align="center" label="配比" prop="colorMatching"/>
                    </el-table>
                  </el-col>
                  <el-col :span="6">
                    <el-divider>尺码配比</el-divider>
                    <el-table stripe border :data="props.row.styleSizeList">
                      <el-table-column align="center" label="尺码" prop="sizeName"/>
                      <el-table-column align="center" label="配比" prop="sizeMatching"/>
                    </el-table>
                  </el-col>
                  <el-col :span="6">
                    <el-divider>订单数量</el-divider>
                    <el-table stripe border :data="props.row.orderNumList">
                      <el-table-column align="center" label="唛头" prop="markName"/>
                      <el-table-column align="center" label="数量" prop="orderNum"/>
                      <el-table-column align="center" label="备注" prop="orderDesc"/>
                    </el-table>
                  </el-col>
                </el-row>

              </template>
            </el-table-column>

            <el-table-column type="index" width="70" align="center" label="序号"/>
            <el-table-column align="center" prop="styleName" label="款号"></el-table-column>
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

            <el-table-column prop="stylePrice" align="center" label="单价（元/打）"/>
            <el-table-column prop="factoryCode" align="center" sortable label="所属工厂"/>
            <el-table-column prop="styleDesc" align="center" label="描述"/>
            <el-table-column prop="orderCodeName" width="110" align="center" label="订单编码"/>
            <el-table-column width="350" align="center" label="操作">
              <template #default="scope">
                <div>
                  <el-tooltip content="编辑" placement="top">
                    <el-button type="warning" icon="Edit" size="default" @click="editStyle(scope.row)"/>
                  </el-tooltip>
                  <el-tooltip content="删除" placement="top">
                    <el-button type="danger" icon="Delete" size="default" @click="delStyle(scope.row)"/>
                  </el-tooltip>
                  <el-button type="primary" icon="" size="default" @click="openSetMatching(scope.row)">设置配比
                  </el-button>
                  <el-button type="primary" icon="" size="default" @click="openSetOrderNum(scope.row)">设置订单量
                  </el-button>
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
            :page-sizes="[5, 10, 15, 20, 25, 30]"
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
        <el-select v-model="orderCodeIdStr" placeholder="请选择所属订单编码" size="large" clearable
                   style="width: 240px">
          <el-option v-for="item in orderCodeList" :key="item.orderCodeId" :label="item.orderCodeName"
                     :value="item.orderCodeId"/>
        </el-select>
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

      <!--新增款号对话框-->
      <el-dialog v-model="dialogVisible" :title="titleVal" @close="close" destroy-on-close width="30%">
        <el-form ref="formDataRef" :model="formData" :rules="rules" label-width="120px">

          <el-form-item label="所属订单编码" prop="orderCodeId">
            <el-select v-model="formData.orderCodeId" placeholder="请选择所属订单编码" size="large" clearable
                       style="width: 240px">
              <el-option v-for="item in orderCodeList" :key="item.orderCodeId" :label="item.orderCodeName"
                         :value="item.orderCodeId"/>
            </el-select>
          </el-form-item>

          <el-form-item label="所属工厂" prop="factoryId">
            <el-select v-model="formData.factoryId" placeholder="请选择所属工厂" size="large" clearable
                       style="width: 240px">
              <el-option v-for="item in factoryList" :key="item.factoryId" :label="item.factoryCode"
                         :value="item.factoryId"/>
            </el-select>
          </el-form-item>

          <el-form-item label="款号" prop="styleName">
            <el-input size="large" style="width: 235px" v-model="formData.styleName"/>
          </el-form-item>
          <el-form-item label="品牌">
            <el-input size="large" style="width: 235px" v-model="formData.brand"/>
          </el-form-item>
          <el-form-item label="成分">
            <el-input size="large" style="width: 235px" v-model="formData.composition"/>
          </el-form-item>
          <el-form-item label="条形码">
            <el-input size="large" style="width: 235px" v-model="formData.barCode"/>
          </el-form-item>

          <el-form-item label="图片" prop="styleImg">
            <div style="text-align: center">
              <el-upload
                  ref="upload"
                  class="avatar-uploader"
                  action="http://localhost:9999/oms/styleDic/img-upload"
                  :show-file-list="false"
                  :on-change="handleAvatarChange"
                  :before-upload="beforeAvatarUpload"
                  :headers="{token}"
                  list-type="picture-card"
                  :on-success="handleAvatarSuccess"
                  :auto-upload="false"
              >
                <img alt="" v-if="imageUrl" :src="imageUrl" class="avatar"/>

                <el-icon v-else class="avatar-uploader-icon">
                  <Plus/>
                </el-icon>

              </el-upload>
              <el-button type="success" @click="submitUpload">
                保存图片
              </el-button>
            </div>

          </el-form-item>
          <el-form-item label="价格">
            <el-input style="width: 220px" :precision="2" :step="0.01" v-model="formData.stylePrice" type="number">
              <template #append>元/打</template>
            </el-input>
          </el-form-item>
          <el-form-item label="描述">
            <el-input size="large" style="width: 235px" v-model="formData.styleDesc"/>
          </el-form-item>
          <el-form-item label="西班牙描述">
            <el-input size="large" style="width: 235px" v-model="formData.fabDesc"/>
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

      <!-- 设置颜色和尺码配比     -->
      <Matching ref="matchingRef" @ok="getData"></Matching>
      <!--设置订单数量      -->
      <OrderNum ref="orderNumRef" @ok="getData"></OrderNum>
    </el-card>
  </div>
</template>

<script setup>
import {reactive, ref} from "vue";
import {Plus} from "@element-plus/icons-vue";
import {getOrderCodeListFn} from "@/api/orderDic.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {getFactoryListFn} from "@/api/dic/factory.js";
import {
  addStyleNumberFn,
  delStyleNumberFn,
  editStyleNumberFn,
  getStyleNumberListFn,
  importExcelFn
} from "@/api/dic/styleNumber.js";
import Matching from "@/components/Matching.vue";
import OrderNum from "@/components/OrderNum.vue";

const upload = ref(null)
const submitUpload = () => {
  upload.value.submit()
  ElMessage.success('图片保存成功')
}
const token = ref(window.sessionStorage.getItem('token'))
//订单编码列表
const orderCodeList = ref([])
// 工厂列表
const factoryList = ref([])
// 表格数据源
const tableData = ref([])

const orderCodeIdStr = ref()

// 图片回显路径
const imageUrl = ref('')
// 添加文件时的回显
const handleAvatarChange = (uploadFile) => {
  const reader = new FileReader();
  // 从上传组件中获取数据
  const image = uploadFile.raw;
  reader.readAsDataURL(image);
  // 读取文件的回调函数
  reader.onload = () => {
    // 将转化的url赋值给文件
    imageUrl.value = reader.result;
    // formData.styleImg = image.name;

  };
}
// 上传成功的回调
const handleAvatarSuccess = (res, uploadFile) => {
  formData.styleImg = res.data
}
// 上传之前做简单验证
const beforeAvatarUpload = (rawFile) => {
  if (rawFile.type !== 'image/jpg'
      && rawFile.type !== 'image/jpeg'
      && rawFile.type !== 'image/png'
      && rawFile.type !== 'image/gif'
      && rawFile.type !== 'image/svg'
      && rawFile.type !== 'image/webp'
  ) {
    ElMessage.error('只能上传图片格式!');
    return false
  } else if (rawFile.size / 1024 / 1024 > 5) {
    ElMessage.error('上传文件不能大于5MB!');
    return false
  }
  return true;
}

//查询数据源
const queryData = reactive({
  factoryId: '', //订单类型
  styleName: '',  //搜索关键字--款号
  orderCodeId: '',   //订单编码Id
  limit: 10,  //商品个数
  pageSize: 6, //每页大小
  pageNum: 1, //页码
  totalNum: 0  //总条数
})

// 显示或隐藏对话框
const dialogVisible = ref(false)
//对话框标题
const titleVal = ref('新增')
//获取表单dom元素
const formDataRef = ref()
// 要修改的款号id
const styleId = ref(0)

//新增/编辑对话框表单数据源
const formData = reactive({
  orderCodeId: '',
  factoryId: '',
  styleName: '',
  styleImg: '',
  stylePrice: '',
  styleDesc: '',
  brand: '',
  composition: '',
  barCode: '',
  fabDesc: ''
})
// 对话框表单验证规则
const rules = reactive({
  orderCodeId: [
    {required: true, message: "请选择所属订单编码！", trigger: "blur"},
  ],
  factoryId: [
    {required: true, message: "请选择所属工厂！", trigger: "blur"},
  ],
  styleName: [
    {required: true, message: "请输入款号！", trigger: "blur"},
  ]
})

// 打开新增对话框
const openDialog = () => {
  // 初始化表单
  titleVal.value = '新增'

  formData.orderCodeId = 3
  formData.factoryId = 11
  formData.styleName = ''
  formData.styleImg = ''
  formData.stylePrice = ''
  formData.styleDesc = ''
  formData.brand = ''
  formData.barCode = ''
  formData.fabDesc = ''
  formData.composition = ''
  imageUrl.value = ''

  dialogVisible.value = true
}

// Excel导入对话框显示与隐藏
const importExcelDialogVisible = ref(false)
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
  formData.append('hh',orderCodeIdStr.value)

  const res = await importExcelFn(formData)
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
  let token = window.sessionStorage.getItem("token")
  //向后端发送请求
  let iframe = document.createElement("iframe")
  iframe.src = "http://localhost:9999/oms/styleDic/exportExcel"
  //iframe隐藏，在页面不显示
  iframe.style.display = "none"
  document.body.appendChild(iframe)
}

//打开编辑对话框
const editStyle = (row) => {
  //初始化表单
  titleVal.value = '编辑'

  styleId.value = row.styleId
  formData.orderCodeId = row.orderCodeId
  formData.factoryId = row.factoryId
  formData.styleName = row.styleName
  formData.styleImg = row.styleImg
  formData.stylePrice = row.stylePrice
  formData.styleDesc = row.styleDesc
  formData.brand = row.brand
  formData.barCode = row.barCode
  formData.fabDesc = row.fabDesc
  formData.composition = row.composition
  imageUrl.value = 'http://localhost:9999/oms' + row.styleImg

  dialogVisible.value = true
}

//确认保存
const submitOk = () => {
  // upload.value.submit()
  formDataRef.value.validate(async valid => {
    if (!valid) {
      return ElMessage.error('验证失败')
    }
    if (titleVal.value === '新增') {
      const res = await addStyleNumberFn(formData)
      // console.log(res)
      if (res.code !== 200) {
        return ElMessage.error(res.message)
      }

      ElMessage({
        message: '添加成功！',
        type: 'success'
      })

      dialogVisible.value = false
      await getData()
    } else if (titleVal.value === '编辑') {
      const res = await editStyleNumberFn(styleId.value, formData)
      if (res.code !== 200) {
        return ElMessage.error(res.message)
      }
      ElMessage({
        message: '修改成功！',
        type: 'success'
      })
      dialogVisible.value = false
      await getData()
    }
  })
}

//删除款号信息
const delStyle = async (row) => {
  const isDel = await ElMessageBox.confirm(
      '是否删除？',
      '提示',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }
  ).catch(error => error)
  if (isDel !== 'confirm') {
    return
  }

  const res = await delStyleNumberFn(row.styleId)
  // console.log(res)
  if (res.code !== 200) {
    return ElMessage.error(res.message)
  }
  ElMessage({
    message: '删除成功！',
    type: 'success'
  })
  await getData()
}

//设置配比组件dom
const matchingRef = ref()
//打开配比设置
const openSetMatching = (row) => {
  matchingRef.value.open(row)
}

//设置订单数量组件dom
const orderNumRef = ref()
//打开订单数量组件
const openSetOrderNum = (row) => {
  orderNumRef.value.open(row)
}
// 关闭
const close = () => {
  for (let prop in formData) {
    formData[prop] = '';
  }
}

//获取款号列表
const getData = async () => {
  const res = await getStyleNumberListFn(queryData)
  if (res.code !== 200) {
    return ElMessage.error(res.message)
  }
  tableData.value = res.data.resultList
  queryData.totalNum = res.data.totalNum
}
getData()

//获取订单编码列表
const getOrderCodeList = async () => {
  const resOC = await getOrderCodeListFn()
  if (resOC.code !== 200) {
    return ElMessage.error(resOC.message)
  }
  orderCodeList.value = resOC.data
}
getOrderCodeList()

//获取工厂列表
const getFactoryList = async () => {
  const resF = await getFactoryListFn()
  if (resF.code !== 200) {
    return ElMessage.error(resF.message)
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

.avatar-uploader, .avatar-uploader .avatar {
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
