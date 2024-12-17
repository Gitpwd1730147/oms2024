import request from "@/utils/request.js";

//新增出货信息
export const addShipmentInfoFn = (data) => {
	return request({
		url: 'shipment/shipmentInfo',
		method: "POST",
		data
	})
}

//分页查询出货单信息列表
export const getShipmentInfoForPage = (params) => {
	return request({
		url: 'shipment/shipmentInfo',
		method: "GET",
		params
	})
}

//删除出货信息
export const delShipmentInfoFn = (id) => {
	return request({
		url: `shipment/shipmentInfo/${id}`,
		method: "DELETE"
	})
}

//编辑出货单信息
export const editShipmentInfoFn = (data) => {
	return request({
		url: 'shipment/shipmentInfo',
		method: "PUT",
		data
	})
}

//从Excel批量导入
export const importExcelForShipmentFn = (data) => {
	return request({
		url: "shipment/importExcel",
		method: "POST",
		data
	})
}