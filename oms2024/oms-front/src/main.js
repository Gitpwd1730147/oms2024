import { createApp } from 'vue'
import router from "./router/index.js";
import ElementPlus from 'element-plus'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import 'element-plus/dist/index.css'
import 'nprogress/nprogress.css'
import store from "@/store/index.js";
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import App from './App.vue'

const app = createApp(App)
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
	app.component(key, component)
}
//使用路由
app.use(router)
//使用element组件
app.use(ElementPlus, {
	locale: zhCn,
})
//使用状态仓库
app.use(store)


app.mount('#app')
