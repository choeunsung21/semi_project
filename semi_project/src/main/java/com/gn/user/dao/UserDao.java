package com.gn.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.board.vo.Board;
import com.gn.user.vo.User;

public class UserDao {
	public List<Board> selectBoardsByUser(SqlSession session, int userNo){
		List<Board> boardList = session.selectList("userMapper.selectBoardsByUser", userNo);
		return boardList;
	}
	
	
	public int MyPageUpdatePw(SqlSession session, User user) {
		int result = session.update("userMapper.MyPageUpdatePw",user);
		return result;
	}
	
	public int changeUserData(SqlSession session, User user) {
		System.out.println("다오"+user);
		int result = session.update("userMapper.changeUserData", user);
		System.out.println(result);
		return result;
		
	}
	
	
	public User loginUser(SqlSession session, User chkUser) {
		User user = session.selectOne("userMapper.userLogin", chkUser);
		return user;
	}
	
	public int createUser(SqlSession session, User createUser) {
		int result = session.insert("userMapper.createUser",createUser);
		result = createUser.getUserNo();
		return result;
	}
	
	public int checkIdUser(SqlSession session, String id){
		int result = session.selectOne("userMapper.checkIdUser",id);
		return result;
	}
}
