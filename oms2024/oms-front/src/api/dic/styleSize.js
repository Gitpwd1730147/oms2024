import request from "@/utils/request.js";

//新增尺码配比
export const addStyleSizeMatchingFn = (data) => {
	return request({
		url: 'styleDic/styleSize',
		method: "POST",
		data
	})
}

//根据款号ID获取响应的尺码配比列表
export const getStyleSizeMatchingListFn = (id) => {
	return request({
		url: `styleDic/styleSizeList/${id}`,
		method: "GET"
	})
}

//根据id修改尺码配比
export const editStyleSizeMatchingFn = (id,data) => {
	return request({
		url: `styleDic/styleSize/${id}`,
		method: "PUT",
		data
	})
}

//删除尺码配比--根据id
export const delStyleSizeMatchingFn = (id) => {
	return request({
		url: `styleDic/styleSize/${id}`,
		method: "DELETE"
	})
}