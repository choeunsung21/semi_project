package com.gn.user.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.gn.user.dao.UserDao;
import com.gn.user.vo.User;

public class UserService {
	
	public int MyPageUpdatePw(User user) {
		SqlSession session = getSqlSession(true);
		int result = new UserDao().MyPageUpdatePw(session, user);
		session.close();
		return result;
	}
	
	public int changeUserData(User user) {
		System.out.println("서비스"+user);
		SqlSession session = getSqlSession(true);
		int result = new UserDao().changeUserData(session, user);
		System.out.println(result);
		session.close();
		return result;
		
	}
	

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
