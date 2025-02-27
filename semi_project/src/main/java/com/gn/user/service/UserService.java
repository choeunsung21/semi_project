package com.gn.user.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.gn.user.dao.UserDao;
import com.gn.user.vo.User;

public class UserService {

	public User loginUser(User chkUser) {
		SqlSession session = getSqlSession(true);
		User user = new UserDao().loginUser(session, chkUser);
		session.close();
		return user;
	}
	
	public int createUser(User createUser) {
		SqlSession session = getSqlSession(true);
		int result = new UserDao().createUser(session, createUser);
		session.close();
		return result;
	}
	
	public int checkIdUser(String id) {
		SqlSession session = getSqlSession(true);
		int result = new UserDao().checkIdUser(session, id);
		session.close();
		return result;
	}
	
}
