package com.gn.apply.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.apply.dao.ApplyDao;
import com.gn.apply.vo.Apply;
import com.gn.player.dao.PlayerDao;
import com.gn.user.vo.User;

public class ApplyService {
    // cjs 가입 신청
	public int insertApply(Apply apply) {
	    SqlSession session = getSqlSession(true); 
	    int result = new ApplyDao().insertApply(session, apply);
	    session.close();
	    return result;
	}
	
	// cjs 중복 방지
	public Apply selectApplyByOptApply(Apply opt) {
		SqlSession session = getSqlSession(true);
		Apply result = new ApplyDao().selectApplyByOptApply(session, opt);
		session.close();
		return result;
	}
	
	// cjs 전체 보낸 가입신청 목록
	public List<Apply> selectApplyAllByUser(User user) {
		SqlSession session = getSqlSession(true);
		List<Apply> resultList = new ApplyDao().selectApplyAllByUser(session, user);
		session.close();
		return resultList;
	}
	
	// cjs 팀장 번호 기준으로 가입신청 목록 조회
	public List<Apply> selectApplyAllByLeaderNo(int leaderNo) {
		SqlSession session = getSqlSession(true);
		List<Apply> resultList = new ApplyDao().selectApplyAllByLeaderNo(session, leaderNo);
		session.close();
		return resultList;
	}
	
	public User selectUserByApplyNo(int applyNo) {
		SqlSession session = getSqlSession(true);
		User user = new ApplyDao().selectUserByApplyNo(session, applyNo);
		session.close();
		return user;
	}
	
	// rejected일 경우 apply 테이블을 update
	public int updateApplyToRejected(int applyNo) {
		SqlSession session = getSqlSession(true);
		int result = new ApplyDao().updateApplyToRejected(session, applyNo);
		session.close();
		return result;
	}
	
	// approved일 경우 apply 테이블을 update해주고 그 내역을 select해서 player테이블에 insert
	public int updateApplyToApproved(int applyNo) {
		SqlSession session = getSqlSession(false);
		
		int resultUpdate = new ApplyDao().updateApplyToApproved(session, applyNo);
		
		if(resultUpdate > 0) {
			Apply apply = new ApplyDao().selectApplyByApplyNo(session, applyNo);
			
			int resultInsert = new PlayerDao().insertPlayer(session, apply);
			
			if(resultInsert > 0) {
				session.commit();
				session.close();
				return 1;
			} else {
				session.rollback();
				return 0;
			}
		} else {
			session.rollback();
			return 0;
		}
	}
}
