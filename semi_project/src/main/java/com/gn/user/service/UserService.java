package com.gn.user.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.board.vo.Board;
import com.gn.plan.vo.Plan;
import com.gn.team.vo.Team;
import com.gn.user.dao.UserDao;
import com.gn.user.vo.User;

public class UserService {
	
	/*
	 * public List<Plan> selectPlanByUse(int userNo){ SqlSession session =
	 * getSqlSession(true); List<Plan> planList = new
	 * UserDao().selectPlanByUse(session, userNo); session.close(); return planList;
	 * }
	 */
	
	//탈퇴 기능 아직 못함
//	public int leaveTeam(Player player) {
//        SqlSession session = getSqlSession(true);
//        int result = new UserDao().leaveTeam(session, player);
//        session.close();
//        return result;
//    }
	
	 
	public List<Team> selectMyTeam(int userNo){
		SqlSession session = getSqlSession(true);
		List<Team> teamList = new UserDao().selectMyTeam(session, userNo);
		session.close();
		return teamList;
	}
	
	public List<Board> selectBoardsByUse(int userNo){
		SqlSession session = getSqlSession(true);
		List<Board> boardList = new UserDao().selectBoardsByUser(session, userNo);
		session.close();
		return boardList;
	}
	
	public int MyPageUpdatePw(User user) {
		SqlSession session = getSqlSession(true);
		int result = new UserDao().MyPageUpdatePw(session, user);
		session.close();
		return result;
	}
	
	public int changeUserData(User user) {
		SqlSession session = getSqlSession(true);
		int result = new UserDao().changeUserData(session, user);
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
	
	// [cjs] user객체에 Id, Pw 담아서 해당하는 객체를 조회
	public User selectUserByIdAndPw(User opt) {
		SqlSession session = getSqlSession(true);
		User user = new UserDao().selectUserByIdAndPw(session, opt);
		session.close();
		return user;
	}
	
	// [cjs] 비밀번호 재검사를 했기 때문에 userId 기준으로 조회해서 해당 레코드 삭제
	public int deleteUser(String userId) {
		SqlSession session = getSqlSession(true);
		int result = new UserDao().deleteUser(session, userId);
		session.close();
		return result;
	}
}
