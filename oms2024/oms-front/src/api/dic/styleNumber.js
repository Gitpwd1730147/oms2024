import request from "@/utils/request.js";

//新增款号
export const addStyleNumberFn = (data) => {
	return request({
		url: 'styleDic/styleNumber',
		method: "POST",
		data
	})
}

//分页获取款号列表
export const getStyleNumberListFn = (params) => {
	return request({
		url: 'styleDic/styleNumber',
		method: "GET",
		params
	})
}

//根据款号id列表分页获取款号列表
export const getStyleNumberListForPageFn = (params) => {
	return request({
		url: 'styleDic/styleNumberList',
		method: "GET",
		params
	})
}

//编辑款号
export const editStyleNumberFn = (id,data) => {
	return request({
		url: `styleDic/styleNumber/${id}`,
		method: 'PUT',
		data
	})
}

//删除款号
export const delStyleNumberFn = (id) => {
	return request({
		url: `styleDic/styleNumber/${id}`,
		method: 'DELETE'
	})
}

//保存颜色配比图
export const saveStyleColorImgFn = (data) => {
	return request({
		url: 'styleDic/styleNumber',
		method: "PUT",
		data
	})
}

//从Excel批量导入
export const importExcelFn = (data) => {
	return request({
		url: "styleDic/importExcel",
		method: "POST",
		data
	})
}