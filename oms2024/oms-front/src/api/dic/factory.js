import request from "@/utils/request.js";

//新增工厂信息
export const addFactoryFn = (data) => {
	return request({
		url: 'factoryDic/factory',
		method: 'POST',
		data
	})
}

//获取工厂信息列表
export const getFactoryListFn = () => {
	return request({
		url: 'factoryDic/factory',
		method: 'GET'
	})
}

//编辑工厂信息
export const editFactoryFn = (id,data) => {
	return request({
		url: `factoryDic/factory/${id}`,
		method: 'PUT',
		data
	})
}

//删除工厂
export const delFactoryFn = (id) => {
	return request({
		url: `factoryDic/factory/${id}`,
		method: "DELETE"
	})
}