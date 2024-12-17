import request from "@/utils/request.js";

//新增包装箱信息
export const addPackingBoxFn = (data) => {
	return request({
		url: 'packingBoxDic/packingBox',
		method: 'POST',
		data
	})
}

//获取包装箱信息列表
export const getPackingBoxListFn = () => {
	return request({
		url: 'packingBoxDic/packingBox',
		method: 'GET'
	})
}

//编辑包装箱信息
export const editPackingBoxFn = (id,data) => {
	return request({
		url: `packingBoxDic/packingBox/${id}`,
		method: 'PUT',
		data
	})
}

//删除包装箱
export const delPackingBoxFn = (id) => {
	return request({
		url: `packingBoxDic/packingBox/${id}`,
		method: "DELETE"
	})
}