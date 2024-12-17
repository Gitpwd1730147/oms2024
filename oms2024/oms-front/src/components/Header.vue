<template>
  <div class="header">
    <!-- 左列 -->
    <span class="logo">
        订单信息管理系统
        </span>
    <el-icon class="icon" @click="setIsShow">
      <Fold />
    </el-icon>
    <!-- 右列 -->
    <div class="f_right">

      <el-tooltip  effect="dark" content="刷新" placement="bottom" :enterable="false">
        <el-icon class="icon" @click="refHandle"><Refresh /></el-icon>
      </el-tooltip>

      <el-tooltip v-if="!isFullscreen"  effect="dark" content="全屏" placement="bottom" :enterable="false">
        <el-icon class="icon" @click="toggle"><FullScreen /></el-icon>
      </el-tooltip>
      <el-tooltip v-else  effect="dark" content="退出全屏" placement="bottom" :enterable="false">
        <el-icon class="icon" @click="toggle"><FullScreen /></el-icon>
      </el-tooltip>
      <el-dropdown @command="commandHandle">
                <span>
                    <el-avatar src="src/assets/li.jpeg"></el-avatar>
                        {{$store.state.userInfo.userCode }}
                    <el-icon class="el-icon--right" style="margin-left:10px">
                    <ArrowDown />
                    </el-icon>
                </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item command="editPassword">修改密码</el-dropdown-item>
            <el-dropdown-item divided command="logout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>

    <!--修改密码对话框 -->
    <el-dialog v-model="dialogVisible" title="修改密码" width="500" @close="closeHandle">
      <el-form
          ref="ruleFormRef"
          :model="ruleForm"
          :rules="rules"
          label-width="auto"
      >
        <el-form-item label="原密码" prop="oldPassword">
          <el-input v-model="ruleForm.oldPassword" show-password clearable />
        </el-form-item>
        <el-form-item label="新密码" prop="password">
          <el-input v-model="ruleForm.password" show-password clearable />
        </el-form-item>
        <el-form-item label="确认密码" prop="rePassword">
          <el-input v-model="ruleForm.rePassword" show-password clearable />
        </el-form-item>
      </el-form>

      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="submitOk">确认</el-button>
        </div>
      </template>
    </el-dialog>

  </div>
</template>

<script setup>
import {ArrowDown, Fold, FullScreen, Refresh} from "@element-plus/icons-vue";
import {useStore} from 'vuex'
import {useFullscreen} from '@vueuse/core'
import {reactive, ref} from "vue";
import {useRouter} from "vue-router";
import {ElMessage, ElMessageBox} from "element-plus";
import {editPwdFn, logoutFn} from "@/api/login.js";

//方法解构
const store = useStore()
const router = useRouter()
const {toggle,isFullscreen} =useFullscreen()

// 显示隐藏对话框
const dialogVisible = ref(false)
//表单dom对象
const ruleFormRef = ref(null)
//表单数据源
const ruleForm = reactive({
  oldPassword:'',
  password: '',
  rePassword: ''
})
//验证规则
const rules = reactive({
  oldPassword: [
    { required: true, message: '请输入原始密码', trigger: 'blur' },
    { min: 5, max: 15, message: '请输入5到15个字符', trigger: 'blur' },
  ],
  password: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
    { min: 5, max: 15, message: '请输入5到15个字符', trigger: 'blur' },
  ],
  rePassword: [
    { required: true, message: '请确认新密码', trigger: 'blur' },
    { min: 5, max: 15, message: '请输入5到15个字符', trigger: 'blur' },
  ]
})

//刷新
const refHandle = () => {
  location.reload()
}

//下拉菜单事件
const commandHandle=(res)=>{
  if (res === 'editPassword') {
    //console.log('修改密码')
    dialogVisible.value = true
  }else if (res === 'logout') {
    logout()
  }
}

//对话框关闭的回调函数
const closeHandle = ()=>{
  ruleFormRef.value.resetFields()
}

//确定修改密码
const submitOk = () => {
  ruleFormRef.value.validate(async isValid=>{
    if (!isValid) {
      return
    }
    const res = await editPwdFn(ruleForm)
    console.log(res.message)
    if (res.code !== 200) {
      ElMessage.error(res.message)
      return
    }
    ElMessage.success(res.message)
    dialogVisible.value = false
   // await logout()
  })

}

//退出登录
const logout =async ()=>{
  const isLogout =await ElMessageBox.confirm(
      '是否退出登录?',
      '系统提示',
      {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
      }
  ).catch(err=>err)
  if (isLogout !=='confirm') {
    return
  }
  const res = await logoutFn()
  if (res.code !== 200) {
    ElMessage.error(res.message)
    return
  }
  //清空本地存储
  window.sessionStorage.removeItem('token')
  //清空vuex数据
  store.commit('setUserInfo',{})
  await router.push({path: '/login'})
}

//隐藏菜单
const setIsShow = () => {
  store.commit('setShow')
}

</script>

<style scoped>
.header {
  height: 100%;
  display: flex;
  color: #fff;
  align-items: center;
  .f_right {
    margin-left: auto;
    display: flex;
    align-items: center;
    height: 100%;
    padding-right: 20px;
    .el-dropdown {
      margin-left: 20px;
      color: #fff;
      cursor: pointer;
      span {
        display: flex;
        align-items: center;
        .el-avatar{
          margin-right: 10px;
        }
      }
    }
  }
  .logo {
    font-size: 18px;
    padding-right: 16px;
  }
  .icon {
    width: 30px;
    height: 100%;
    cursor: pointer;
    font-size: 18px;
    font-weight: bold;
  }
  .icon:hover {
    background: #065327;
  }
}
</style>