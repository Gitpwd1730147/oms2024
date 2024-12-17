import request from "@/utils/request.js";

//新增客户信息
export const addCustomerFn = (data) => {
	return request({
		url: 'customerDic/customer',
		method: 'POST',
		data
	})
}

//获取客户信息列表
export const getCustomerListFn = () => {
	return request({
		url: 'customerDic/customerList',
		method: 'GET'
	})
}

//编辑客户信息
export const editCustomerFn = (id,data) => {
	return request({
		url: `customerDic/customer/${id}`,
		method: 'PUT',
		data
	})
}

//删除客户
export const delCustomerFn = (id) => {
	return request({
		url: `customerDic/customer/${id}`,
		method: "DELETE"
	})
}
