<template>
  <div class="login">
    <el-card class="box-card" shadow="always">
      <div style=" padding: 40px 0 60px 0; text-align: center; color: #409eff; font-size: 50px; font-weight: bold; letter-spacing: 3px;">订单管理系统</div>

      <el-form ref="loginForm" :model="loginUser" :rules="rules" size="large" label-position="right" label-width="70px" style="width: 360px; margin: 0 auto">
        <el-form-item label="账号" prop="userCode">
          <el-input v-model="loginUser.userCode" clearable>
            <template #prefix>
              <el-icon><Avatar /></el-icon>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item label="密码" prop="userPwd">
          <el-input type="password" v-model="loginUser.userPwd" show-password clearable>
            <template #prefix>
              <el-icon><Lock /></el-icon>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item label="验证码" prop="verificationCode">
          <el-input v-model="loginUser.verificationCode">
            <template #suffix>
              <el-image
                  style="overflow: visible; position: relative; left: 16px;"
                  :src="codeSrc"
                  @click="codeSrc=codeSrc+'?'+new Date()"
              ></el-image>
            </template>
          </el-input>
        </el-form-item>
      </el-form>
      <div style="text-align: right; width: 360px; margin: 40px auto 0">
        <el-button @click="login" type="primary" size="large" style="width: 300px" :loading="isLoading">登录</el-button>
      </div>
    </el-card>
  </div>
</template>

<script setup>
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";
import {Avatar, Lock} from "@element-plus/icons-vue";
import { loginFn} from "@/api/login.js";
import {ElMessage} from "element-plus";
import {useStore} from "vuex";

//避免重复登录设置
const isLoading = ref(false)
//表单dom元素
const loginForm = ref();

const router = useRouter(); // 获取路由器

const store = useStore()
//登录数据源
const loginUser = reactive({
  userCode: "admin",
  userPwd: "123456",
  verificationCode: ""
});

// 验证码后台接口
const codeSrc = ref('http://localhost:9999/oms/captcha/captchaImage');

//表单元素验证规则
const rules = reactive({
  userCode: [
    {required: true, message: "请输入账号！", trigger: "blur"},
    { min: 3, max: 15, message: '请输入3到15个字符', trigger: 'blur' },
  ],
  userPwd: [
    {required: true, message: "请输入密码！", trigger: "blur"},
    { min: 6, max: 18, message: '请输入6到18个字符', trigger: 'blur' },
  ],
  verificationCode: [
    {min: 4, max: 4, required: true, message: "请输入正确的验证码！", trigger: "blur"}
  ]
})

// 回车登录
window.onkeydown = ($event) => {
  if($event.key && $event.key === 'Enter'){
    login();
  }
}

const login = () => {
  loginForm.value.validate(async (valid) => {
    if (!valid) {
      return
    }
    isLoading.value = true
    const res =await loginFn(loginUser)
   // console.log(res)
    if (res.code !== 200) {
      ElMessage.error(res.message)
      isLoading.value = false
      return
    }
    isLoading.value = false
    //登录成功后，保存token信息
    window.sessionStorage.setItem('token',res.data)
    ElMessage.success('登陆成功')

    //跳转到首页
    await router.push({path: '/home'})
  });
}
</script>


<style scoped>
.login {
  background-image: url("/login.jpg");
  background-size: 100% 100%;

  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;

  display: flex;
  justify-content: center;
  align-items: center;
}
.box-card {
  width: 800px;
  height: 500px;
  opacity: 0.92;
}
</style>
