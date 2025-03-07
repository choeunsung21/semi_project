package com.gn.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.user.vo.User;

public class UserDao {
	public User loginUser(SqlSession session, User chkUser) {
		User user = session.selectOne("userMapper.userLogin", chkUser);
		return user;
	}
	
	public int createUser(SqlSession session, User createUser) {
		int result = session.insert("userMapper.createUser",createUser);
		return result;
	}
	
	public int checkIdUser(SqlSession session, String id){
		int result = session.selectOne("userMapper.checkIdUser",id);
		return result;
	}
}
