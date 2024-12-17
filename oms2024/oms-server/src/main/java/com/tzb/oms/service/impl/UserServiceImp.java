package com.tzb.oms.service.impl;


import com.tzb.oms.entity.User;
import com.tzb.oms.mapper.UserMapper;
import com.tzb.oms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImp implements UserService {

	//注入UserMapper
	@Autowired
	private UserMapper userMapper;

	//根据用户名查找用户的业务方法
	@Override
	public User findUserByCode(String userCode) {
		return userMapper.findUserByCode(userCode);
	}

	//修改密码
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int modifyPwdById(User user) {
		return userMapper.editPwdById(user);
	}


}
