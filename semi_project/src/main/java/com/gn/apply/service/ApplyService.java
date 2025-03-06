package com.gn.apply.service;

import org.apache.ibatis.session.SqlSession;
import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.Map;

import com.gn.apply.dao.ApplyDao;
import com.gn.apply.vo.Apply;

public class ApplyService {
	public int insertApply(Apply apply) {
		SqlSession session = getSqlSession(true);
		int result = new ApplyDao().insertApply(session, apply);
		session.close();
		return result;
	}
	// 중복 신청 방지
	public boolean isAlreadyApplied(int userNo, int teamNo) {
	    SqlSession session = getSqlSession(true);
	    int count = session.selectOne("applyMapper.checkDuplicateApply", Map.of("userNo", userNo, "teamNo", teamNo));
	    session.close();
	    return count > 0;
	}
	
}