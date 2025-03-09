package com.gn.apply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.apply.vo.Apply;
import com.gn.user.vo.User;

public class ApplyDao {
	// 팀 가입 신청
	public int insertApply(SqlSession session, Apply apply) {
      return session.insert("applyMapper.insertApply", apply);
    }
	
	// cjs 중복 방지
	public Apply selectApplyByOptApply(SqlSession session, Apply opt) {
		return session.selectOne("applyMapper.selectApplyByOptApply", opt);
	}
	
	// cjs 보낸 가입 신청 목록
	public List<Apply> selectApplyAllByUser(SqlSession session, User user) {
		return session.selectList("applyMapper.selectApplyAllByUser", user);
	}
	
	// cjs 팀장 번호 기준으로 가입신청 목록 조회
	public List<Apply> selectApplyAllByLeaderNo(SqlSession session, int leaderNo) {
		return session.selectList("applyMapper.selectApplyAllByLeaderNo", leaderNo);
	}
	
	public User selectUserByApplyNo(SqlSession session, int applyNo) {
		return session.selectOne("applyMapper.selectUserByApplyNo", applyNo);
	}
	
	// rejected일 경우 apply 테이블을 update
	public int updateApplyToRejected(SqlSession session, int applyNo) {
		return session.update("applyMapper.updateApplyToRejected", applyNo);
	}
	
	// approved일 경우 apply 테이블을 update
	public int updateApplyToApproved(SqlSession session, int applyNo) {
		return session.update("applyMapper.updateApplyToApproved", applyNo);
	}
	
	// 변경 후에 apply 객체를 조회함
	public Apply selectApplyByApplyNo(SqlSession session, int applyNo) {
		return session.selectOne("applyMapper.selectApplyByApplyNo", applyNo);
	}
	
	// 문제가 발생하였을 때 apply 테이블을 update - 다시 PENDING으로
	public int updateApplyToPending(SqlSession session, int applyNo) {
		return session.update("applyMapper.updateApplyToPending", applyNo);
	}
}
	
   
