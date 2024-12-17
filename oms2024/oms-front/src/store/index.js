import {createStore} from "vuex";
import {getUserInfoFn} from "@/api/login.js";

const store = createStore({
	state(){
		return{
			//管理员信息
			userInfo:{},
			//控制导航菜单是否隐藏
			isShow:false
		}
	},
	mutations:{
		setUserInfo(state,userInfo){
			//修改登录用户信息
			state.userInfo = userInfo
		},
		//修改isShow
		setShow(state){
			state.isShow = !state.isShow
		}
	},
	actions:{
		getUserInfo(context){
			return new Promise((resolve, reject)=>{
				getUserInfoFn().then(res =>{
					context.commit('setUserInfo',res.data)
					resolve(res)
				}).catch(err => reject(err))
			})
		}

	}
})

export default store