//登录相关的api接口

import request from "@/utils/request.js";

//登录
export const loginFn = (data) => {
	return request({
		url: '/login',
		method: "POST",
		data
	})
}

//获取当前用户信息
export const getUserInfoFn = () => {
	return request({
		url: '/curr-user',
		method: "GET"
	})
}

//退出登录
export const logoutFn = () => {
	return request({
		url: '/logout',
		method: "DELETE",
	})
}

//修改密码
export const editPwdFn = (data) => {
	return request({
		url: '/updatePwd',
		method: "POST",
		data
	})
}