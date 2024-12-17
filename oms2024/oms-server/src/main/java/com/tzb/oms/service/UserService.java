package com.tzb.oms.service;


import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.User;
import com.tzb.oms.page.Page;

public interface UserService {

	//根据用户名查找用户的业务方法
	public User findUserByCode(String userCode);

	//根据用户id修改密码
	public int modifyPwdById(User user);


}
