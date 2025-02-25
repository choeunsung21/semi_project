package com.gn.user.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.user.vo.User;

public class UserDao {
	public User loginUser(SqlSession session, User chkUser) {
		User user = session.selectOne("userMapper.userLogin", chkUser);
		
		return user;
	}
}
