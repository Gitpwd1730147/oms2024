import request from "@/utils/request.js";

//新增款号颜色配比
export const addStyleColorMatchingFn = (data) => {
	return request({
		url: 'styleDic/styleColor',
		method: "POST",
		data
	})
}

//根据款号ID获取响应的颜色配比列表
export const getStyleColorMatchingListFn = (id) => {
	return request({
		url: `styleDic/styleColorList/${id}`,
		method: "GET"
	})
}

//删除颜色配比--根据id
export const delStyleColorMatchingFn = (id) => {
	return request({
		url: `styleDic/styleColor/${id}`,
		method: "DELETE"
	})
}

//根据id修改颜色配比
export const editStyleColorMatchingFn = (id,data) => {
	return request({
		url: `styleDic/styleColor/${id}`,
		method: "PUT",
		data
	})
}