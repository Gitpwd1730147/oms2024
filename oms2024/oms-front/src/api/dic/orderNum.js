import request from "@/utils/request.js";

//新增款号订单数量信息
export const addOrderNumFn = (data) => {
	return request({
		url: 'styleDic/orderNum',
		method: "POST",
		data
	})
}

//根据款号id获取订单数量信息列表
export const getOrderNumListFn = (id) => {
	return request({
		url: `styleDic/orderNumList/${id}`,
		method: "GET"
	})
}

//根据ID修改订单数量信息
export const editOrderInfoFn = (id,data) => {
	return request({
		url: `styleDic/orderNum/${id}`,
		method: "PUT",
		data
	})
}

//根据ID删除订单数量信息
export const delOrderInfoFn = (id) => {
	return request({
		url: `styleDic/orderNum/${id}`,
		method: "DELETE"
	})
}

//获取订单的分页信息
export const getOrderInfoListForPageFn = (params) => {
	return request({
		url: 'order/orderInfo',
		method: "GET",
		params
	})
}

export const exportOrderToExcelFn = (params) => {
	return request({
		url: 'order/exportExcel',
		method: "GET",
		responseType: "blob",
		params
	})
}