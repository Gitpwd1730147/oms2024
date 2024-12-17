import request from "@/utils/request.js";

//新增唛头信息
export const addMarkFn = (data) => {
	return request({
		url: 'markDic/mark',
		method: 'POST',
		data
	})
}

//获取唛头信息列表
export const getMarkListFn = () => {
	return request({
		url: 'markDic/mark',
		method: 'GET'
	})
}

//编辑唛头信息
export const editMarkFn = (id,data) => {
	return request({
		url: `markDic/mark/${id}`,
		method: 'PUT',
		data
	})
}

//删除唛头
export const delMarkFn = (id) => {
	return request({
		url: `markDic/mark/${id}`,
		method: "DELETE"
	})
}