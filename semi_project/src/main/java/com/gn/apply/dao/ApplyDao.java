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
	
//	// 받은 가입 신청 목록
//	public int receiveApply(SqlSession session, Apply apply) {
//		return session.receive("applyMapper.receiveApply", apply);
//	}
//	// 보낸 가입 신청 목록
//	public int sendApply(SqlSession session, Apply apply) {
//		return session.send("applyMapper.sendApply", apply);
//	}
//	// 팀 탈퇴
//	public boolean secession(SqlSession session, Apply apply) {
//		return session.secession("applyMapper.secession", apply);
//	}
	
}
	
   
