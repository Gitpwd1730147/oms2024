import request from "@/utils/request.js";

//新增订单编码
export const addOrderCodeFn = (data) => {
	return request({
		url: 'orderDic/orderCode',
		method: "POST",
		data
	})
}

//获取订单编码列表
export const getOrderCodeListFn = () => {
	return request({
		url: 'orderDic/orderCodeList',
		method: "GET"
	})
}

//编辑订单编码
export const editOrderCodeFn = (data) => {
	return request({
		url: `orderDic/editOrderCode`,
		method: "POST",
		data
	})
}

//删除订单编码
export const delOrderCodeFn = (orderCodeId) => {
	return request({
		url: `/orderDic/delOrderCode/${orderCodeId}`,
		method: "DELETE"
	})
}