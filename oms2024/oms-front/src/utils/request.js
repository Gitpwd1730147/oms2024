//封装axios
import axios from 'axios';

const instance = axios.create({
	//请求接口的基准地址
	baseURL: '/api',
	timeout: 5000
})

//请求拦截器
instance.interceptors.request.use(config  =>{
	const token = window.sessionStorage.getItem('token')
	if(token){
		config.headers['token']=token
	}
	return config
})

//响应拦截器
instance.interceptors.response.use(response => {
	return response.data
}, err => {
	return err.response.data
})

//instance暴露出去
export default instance