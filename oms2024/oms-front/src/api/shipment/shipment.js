import request from "@/utils/request.js";

//新增出货单编码
export const addShipmentCodeFn = (data) => {
	return request({
		url: 'shipment/shipmentCode',
		method: "POST",
		data
	})
}

//分页查询出货单列表
export const getShipmentCodeListForPageFn = (params) => {
	return request({
		url: 'shipment/shipmentCode',
		method: "GET",
		params
	})
}

//编辑出货单编码
export const editShipmentCodeFn = (data) => {
	return request({
		url: 'shipment/shipmentCode',
		method: "PUT",
		data
	})

}

//删除出货单编码
export const delShipmentCodeFn = (id) => {
	return request({
		url: `shipment/shipmentCode/${id}`,
		method: "DELETE"
	})
}

//获取出货单编码列表
export const getShipmentCodeListFn = () => {
	return request({
		url: 'shipment/shipmentCodeList',
		method: "GET"
	})
}