//路由模块
import {createRouter,createWebHashHistory } from 'vue-router'
import store from "@/store/index.js";
import np from 'nprogress'
//路由匹配柜则
const routes = [
	{
		path: '/home',
		component: ()=> import('@/views/Home.vue'),
		children:[
			{
				path: '/home',
				name: '/home',
				component: ()=> import('@/views/HomeIndex.vue'),
				meta:{
					title:'系统首页'
				}
			},
			{
				path: '/orderCode',
				name: '/orderCode',
				component: ()=> import('@/views/OrderCode.vue'),
				meta:{
					title:'订单号管理'
				}
			},
			{
				path: '/customer',
				name: '/customer',
				component: ()=> import('@/views/Customer.vue'),
				meta:{
					title:'客户管理'
				}
			},
			{
				path: '/factory',
				name: '/factory',
				component: ()=> import('@/views/Factory.vue'),
				meta:{
					title:'工厂管理'
				}
			},
			{
				path: '/mark',
				name: '/mark',
				component: ()=> import('@/views/Mark.vue'),
				meta:{
					title:'唛头管理'
				}
			},
			{
				path: '/styleNumber',
				name: '/styleNumber',
				component: ()=> import('@/views/StyleNumber.vue'),
				meta:{
					title:'款号管理'
				}
			},
			{
				path: '/shipmentCode',
				name: '/shipmentCode',
				component: ()=> import('@/views/ShipmentCode.vue'),
				meta:{
					title:'出货单设置'
				}
			},
			{
				path: '/orderInfo',
				name: '/orderInfo',
				component: ()=> import('@/views/OrderInfo.vue'),
				meta:{
					title:'订单查询'
				}
			},
			{
				path: '/shipmentInfo',
				name: '/shipmentInfo',
				component: ()=> import('@/views/ShipmentInfo.vue'),
				meta:{
					title:'出货单管理'
				}
			},
			{
				path: '/packingBox',
				name: '/packingBox',
				component: ()=> import('@/views/PackingBox.vue'),
				meta:{
					title:'包装箱管理'
				}
			},
		]
	},
	{
		path: '/login',
		component: ()=> import('@/views/Login.vue')
	},
	{
		path: '/homeT',
		name: '/homeT',
		component: ()=> import('@/views/HomeT.vue')
	},
	{
		path: '/:pathMatch(.*)*',
		name: 'NotFound',
		component: ()=> import('@/views/404.vue')
	},
	{
		path: '/',
		component: ()=> import('@/views/Login.vue')
	},
]

const router = createRouter({
	history: createWebHashHistory(),
	routes
})

//前置全局路由守卫
router.beforeEach(async (to,from,next)=>{
	//开启进度条
	np.start()
	//获取token
	const tokenStr = window.sessionStorage.getItem('token')
	if (tokenStr) {
		await store.dispatch('getUserInfo')
	}

	//如果没有登录
	if (!tokenStr && to.path !== '/login') {
		return next('/login')
	}
	//如果已经登录
	if (tokenStr && to.path === '/login') {
		return next({path:from.path?from.path:'/'})
	}
	next()
})

//后置全局路由守卫
router.afterEach((to,from,next)=>{
	np.done()
})
export default router