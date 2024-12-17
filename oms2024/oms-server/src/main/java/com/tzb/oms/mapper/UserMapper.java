package com.tzb.oms.mapper;


import com.tzb.oms.entity.User;



public interface UserMapper {

	//根据用户名查找用户的方法
	public User findUserByCode(String userCode);

	/**
	 * 根据用户id修改密码
	 * @param user
	 * @return
	 */
	public int editPwdById(User user);




}
