package com.gn.apply.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.gn.apply.dao.ApplyDao;
import com.gn.apply.vo.Apply;

public class ApplyService {
    // 가입 신청
	public int insertApply(Apply apply) {
	    SqlSession session = getSqlSession(true); // 자동 커밋 모드
	    try {
	        return new ApplyDao().insertApply(session, apply);
	    } finally {
	        session.close(); // 세션 종료
	    }
	}
}
