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
}
	
   
