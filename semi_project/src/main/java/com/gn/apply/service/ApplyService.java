package com.gn.apply.service;

import org.apache.ibatis.session.SqlSession;
import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.Map;
import com.gn.apply.vo.Apply;

public class ApplyService {
    // 가입 신청 (INSERT 실행)
	public int insertApply(Apply apply) {
	    SqlSession session = getSqlSession(true);
	    int result = 0;

	    try {
	        result = session.insert("applyMapper.insertApply", apply);
	        session.commit(); // 수동 커밋 추가
	    } catch (Exception e) {
	        session.rollback(); // 오류 발생 시 롤백
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }

	    return result;
	}
	// 중복 신청 방지
	public boolean isAlreadyApplied(int userNo, int teamNo) {
	    SqlSession session = getSqlSession(true);
	    int count = session.selectOne("applyMapper.checkDuplicateApply", Map.of("userNo", userNo, "teamNo", teamNo));
	    session.close();
	    return count > 0;
	}
	public boolean updateApplyStatus(int applyNo, String status) {
	    SqlSession session = getSqlSession(false);
	    boolean success = false;
	    
	    try {
	        int result = session.update("applyMapper.updateApplyStatus", Map.of("applyNo", applyNo, "status", status));
	        
	        // 승인된 경우, 팀 멤버 테이블에 추가
	        if (result > 0 && "APPROVED".equals(status)) {
	            session.insert("applyMapper.insertTeamMember", applyNo);
	        }

	        session.commit();
	        success = true;
	    } catch (Exception e) {
	        session.rollback();
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    
	    return success;
	}
	
}