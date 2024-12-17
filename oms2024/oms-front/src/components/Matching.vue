<template>
<div>
  <!--设置款号配比对话框-->
  <el-dialog  v-model="dialogVisible" title="设置配比" @close="close" destroy-on-close width="40%">
      <el-card style="width: 100%" shadow="always">
        <el-row>
          <el-col style="font-size: large;">
            款号:&nbsp;&nbsp;{{styleName}}
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col span="10" style="font-size: large;" >配比</el-col>
          <el-col span="14">
            <el-radio-group v-model="matchType">
              <el-radio :value="0" border>颜色配比</el-radio>
              <el-radio :value="1" border>尺码配比</el-radio>
            </el-radio-group>
          </el-col>
        </el-row>
      </el-card>

      <!--颜色配比-->
      <template v-if="matchType === 0">
        <el-form ref="formDataRef" :model="formData" :rules="rules" label-width="120px">
        <el-card style="width: 100%" shadow="always">
          <el-row>
            <el-col>
              <el-form-item label="图片" prop="styleColorImg">
                <div style="text-align: center">
                  <el-upload
                      ref="upload"
                      class="avatar-uploader"
                      action="http://localhost:9999/oms/styleDic/img-upload"
                      :show-file-list="false"
                      :on-change="handleAvatarChange"
                      :before-upload="beforeAvatarUpload"
                      list-type="picture-card"
                      :on-success="handleAvatarSuccess"
                      :auto-upload="false"
                  >
                    <img style="width: 150px;height: 150px"  v-if="imageUrl" :src="imageUrl" class="avatar" />
                    <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
                  </el-upload>
                  <el-button  type="success" @click="submitUpload">保存图片</el-button>
                  <el-button  type="success" @click="saveUpload">上传服务器</el-button>
                </div>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="15">
            <el-col :span="8">
              <el-form-item style="width: 250px" label="颜色" prop="colorName">
                <el-input
                    v-model="formData.colorName"
                    placeholder="请输入颜色"
                />
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item   label="配比" prop="colorMatching">
                <el-input-number v-model="formData.colorMatching" :min="1" :max="10"  />
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-button v-if="flag ==='add'" type="primary" @click="addStyleColor">添加</el-button>
              <el-button  v-if="flag ==='edit'" type="primary" @click="saveEditStyleColor">保存修改</el-button>
              <el-button  v-if="flag ==='edit'" type="primary" @click="cancelEditStyleColor">取消</el-button>
            </el-col>
          </el-row>
          <el-card style="width: 100%" shadow="always">
          <el-row>
            <el-col style="text-align: center;font-size: medium">颜色配比信息</el-col>
          </el-row>
          <el-row>
            <el-col>
              <el-table :data="tableDataColor" border style="width: 100%">
                <el-table-column align="center" prop="colorName" label="颜色" width="180" />
                <el-table-column align="center" prop="colorMatching" label="配比" width="180" />
                <el-table-column align="center"  label="操作" >
                  <template #default="scope">
                    <div>
                        <el-button type="warning" icon="Edit" size="small" @click="editStyleColor(scope.row)"/>
                        <el-button type="danger" icon="Delete" size="small" @click="delStyleColor(scope.row)"/>
                    </div>
                  </template>
                </el-table-column>
              </el-table>
            </el-col>
          </el-row>
          </el-card>
        </el-card>
        </el-form>
      </template>

      <!--尺码配比-->
      <template v-if="matchType === 1">
        <el-form ref="formDataSizeRef" :model="formDataSize" :rules="rulesSize" label-width="120px">
        <el-card style="width: 100%" shadow="always">
          <el-row :gutter="15">
            <el-col :span="8">
              <el-form-item style="width: 250px" label="尺码" prop="sizeName">
                <el-input
                    v-model="formDataSize.sizeName"
                    placeholder="请输入尺码"
                />
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item  label="配比" prop="sizeMatching">
                <el-input-number v-model="formDataSize.sizeMatching" :min="1" :max="10"  />
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-button v-if="flagS ==='add'" type="primary" @click="addStyleSize">添加</el-button>
              <el-button  v-if="flagS ==='edit'" type="primary" @click="saveEditStyleSize">保存修改</el-button>
              <el-button  v-if="flagS ==='edit'" type="primary" @click="cancelEditStyleSize">取消</el-button>
            </el-col>
          </el-row>

          <el-card style="width: 100%" shadow="always">
          <el-row>
            <el-col style="text-align: center;font-size: medium">尺码配比信息</el-col>
          </el-row>
          <el-row>
            <el-col>
              <el-table :data="tableDataSize" border style="width: 100%">
                <el-table-column align="center" prop="sizeName" label="尺码" width="180" />
                <el-table-column align="center" prop="sizeMatching" label="配比" width="180" />
                <el-table-column align="center"  label="操作" >
                  <template #default="scope">
                    <div>
                      <el-button type="warning" icon="Edit" size="small" @click="editStyleSize(scope.row)"/>
                      <el-button type="danger" icon="Delete" size="small" @click="delStyleSize(scope.row)"/>
                    </div>
                  </template>
                </el-table-column>
              </el-table>
            </el-col>
          </el-row>
          </el-card>
        </el-card>
        </el-form>
      </template>

  </el-dialog>
</div>
</template>

<script setup>
import {Plus} from "@element-plus/icons-vue";
import {reactive, ref} from "vue";
import {ElMessage, ElMessageBox} from "element-plus";
import {saveStyleColorImgFn} from "@/api/dic/styleNumber.js";
import {
  addStyleColorMatchingFn,
  delStyleColorMatchingFn,
  editStyleColorMatchingFn,
  getStyleColorMatchingListFn
} from "@/api/dic/styleColor.js";
import {
  addStyleSizeMatchingFn,
  delStyleSizeMatchingFn,
  editStyleSizeMatchingFn,
  getStyleSizeMatchingListFn
} from "@/api/dic/styleSize.js";

//修改或新增标志
const flag = ref('add')
const flagS =ref('add')

//表格数据源
const tableDataColor = ref([])
const tableDataSize = ref([])

//对话框隐藏/显示
const dialogVisible = ref(false)

const styleName = ref('')
const styleId =ref(0)
const  matchType = ref(0)

//表单数据源
const formData = reactive({
  colorName: '',
  colorMatching: 1,
  styleColorImg: '',

})
const formDataSize = reactive({
  sizeName: '',
  sizeMatching: 1
})

// 对话框表单验证规则
const rules = reactive({
  colorName: [
    {required: true, message: "请输入颜色名称", trigger: "blur"},
  ],
  colorMatching: [
    {required: true, message: "请输入颜色配比！", trigger: "blur"},
  ]
})
const rulesSize = reactive({
  sizeName: [
    {required: true, message: "请输入颜色名称", trigger: "blur"},
  ],
  sizeMatching: [
    {required: true, message: "请输入颜色配比！", trigger: "blur"},
  ]
})

//表单dom元素
const formDataRef = ref(null)
const formDataSizeRef = ref(null)

//自定义事件调用父组件方法
const emit = defineEmits(["ok"])

//保存图片
const upload =ref(null)
const submitUpload = () => {
  upload.value.submit()
  ElMessage.success('图片保存成功')
}

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
  };
}
// 上传成功的回调
const handleAvatarSuccess = (res, uploadFile) => {
  formData.styleColorImg = res.data
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

//打开配比对话框
const open = (styleNumber) => {
  styleId.value = styleNumber.styleId
  styleName.value = styleNumber.styleName
  matchType.value = 0

  formData.styleColorImg = styleNumber.styleColorImg
  if (styleNumber.styleColorImg !== null) {
    imageUrl.value ='http://localhost:9999/oms' + styleNumber.styleColorImg
  }else {
    imageUrl.value = styleNumber.styleColorImg
  }
  getDataColor()
  getDataSize()
  dialogVisible.value =true
}

// 新增颜色配比
const addStyleColor = () => {
  formDataRef.value.validate(async valid =>{
    if (!valid) {
      return  ElMessage.error('验证失败')
    }
    let data = {
      styleId: styleId.value,
      colorName: formData.colorName,
      colorMatching: formData.colorMatching
    }
  const res = await addStyleColorMatchingFn(data)
  if (res.code !== 200) {
    return ElMessage.error(res.message)
  }

  formData.colorName = ''
  formData.colorMatching = 1

  ElMessage({
    message: '添加成功！',
    type: 'success'
  })
    emit('ok')
  await getDataColor()
  })
}

//颜色配比id
const styleColorId = ref(0)
//点击进入修改状态
const editStyleColor = (row) => {
  flag.value = 'edit'
  styleColorId.value = row.styleColorId
  formData.colorName = row.colorName
  formData.colorMatching = row.colorMatching
}
//修改保存
const saveEditStyleColor = () => {
  formDataRef.value.validate(async valid => {
    if (!valid) {
      return ElMessage.error('验证失败')
    }
    const res = await editStyleColorMatchingFn(styleColorId.value, formData)
    if (res.code !== 200) {
      return ElMessage.error(res.message)
    }

    formData.colorName = ''
    formData.colorMatching = 1
    flag.value = 'add'

    ElMessage({
      message: '修改成功！',
      type: 'success'
    })
    emit('ok')
    await getDataColor()
  })
}

//取消修改状态
const cancelEditStyleColor = () => {
  flag.value = 'add'
  formData.colorName = ''
  formData.colorMatching = 1
}

//删除颜色配比
const delStyleColor =async (row) => {
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

  const res = await delStyleColorMatchingFn(row.styleColorId)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  ElMessage({
    message: '删除成功！',
    type: 'success'
  })
  emit('ok')
  await getDataColor()

}

// ------------尺码配比----------------
//新增尺码配比
const addStyleSize = () => {
  formDataSizeRef.value.validate(async valid =>{
    if (!valid) {
      return  ElMessage.error('验证失败')
    }

    let data = {
      styleId: styleId.value,
      sizeName: formDataSize.sizeName,
      sizeMatching: formDataSize.sizeMatching
    }
    const res = await addStyleSizeMatchingFn(data)

    if (res.code !== 200) {
      return ElMessage.error(res.message)
    }

    formDataSize.sizeName = ''
    formDataSize.sizeMatching = 1

    ElMessage({
      message: '添加成功！',
      type: 'success'
    })
    emit('ok')
    await getDataSize()
  })
}

//要修改的尺码配比ID
const styleSizeId = ref(0)
//修改尺码配比
const editStyleSize = (row) => {
  flagS.value = 'edit'
  styleSizeId.value = row.styleSizeId
  formDataSize.sizeName = row.sizeName
  formDataSize.sizeMatching = row.sizeMatching
}
//取消尺码配比修改状态
const cancelEditStyleSize = () => {
  flagS.value = 'add'
  formDataSize.sizeMatching = 1
  formDataSize.sizeName = ''
}
// 保存修改的尺码配比信息
const saveEditStyleSize = () => {
  formDataSizeRef.value.validate(async valid => {
    if (!valid) {
      return ElMessage.error('验证失败')
    }
    const res = await editStyleSizeMatchingFn(styleSizeId.value, formDataSize)
    if (res.code !== 200) {
      return ElMessage.error(res.message)
    }

    formDataSize.sizeName = ''
    formDataSize.sizeMatching = 1
    flagS.value = 'add'

    ElMessage({
      message: '修改成功！',
      type: 'success'
    })
    emit('ok')
    await getDataSize()
  })
}
//删除尺码配比
const delStyleSize =async (row) => {
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

  const res = await delStyleSizeMatchingFn(row.styleSizeId)
  if (res.code !== 200) {
    return  ElMessage.error(res.message)
  }
  ElMessage({
    message: '删除成功！',
    type: 'success'
  })
  emit('ok')
  await getDataSize()
}

//根据款号id获取尺码配比列表
const getDataSize =async () => {
  const res = await getStyleSizeMatchingListFn(styleId.value)
  if (res.code !== 200) {
    return ElMessage.error(res.message)
  }
  tableDataSize.value = res.data
}



//关闭配比对话框
const close = () => {
 //清空表单元素
  styleId.value = 0

  formData.colorMatching = 1
  formData.colorName = ''
  formData.styleColorImg = ''
  flag.value = 'add'

  formDataSize.sizeName = ''
  formDataSize.sizeMatching = 1
  flagS.value = 'add'

  matchType.value = 0

  dialogVisible.value = false
}

//保存颜色配比图片至款号信息
const saveUpload =async () => {
  let data = {
    styleColorImg : formData.styleColorImg,
    styleId : styleId.value
  }
  const res = await saveStyleColorImgFn(data)
  if (res.code !== 200) {
    return ElMessage.error(res.message)
  }
  emit('ok')
  ElMessage({
    message: '图片已上传服务器！',
    type: 'success'
  })

}


//根据款号id获取颜色配比列表
const getDataColor =async () => {
  const res = await getStyleColorMatchingListFn(styleId.value)
  if (res.code !== 200) {
    return ElMessage.error(res.message)
  }
  tableDataColor.value = res.data
}



// 暴漏方法，其他组件使用
defineExpose({open})
</script>

<style lang='less' scoped>
.el-row {
  margin-bottom: 20px;
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
