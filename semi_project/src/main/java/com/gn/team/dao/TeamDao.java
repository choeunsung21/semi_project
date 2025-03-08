package com.gn.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gn.team.vo.Team;

public class TeamDao {
    // 팀 생성
	 public int insertTeam(SqlSession session, Team team) {
	        return session.insert("teamMapper.insertTeam", team);
	}
    // 팀 목록 조회 (페이징 포함)
    public List<Team> selectTeamList(SqlSession session, Team team) {
        return session.selectList("teamMapper.teamList", team);
    }

    // 전체 팀 개수 조회 (페이징 처리용)
    public int selectTeamCount(SqlSession session, Team team) {
        return session.selectOne("teamMapper.selectTeamCount", team);
    }

    // 특정 팀 상세 조회
    public Team selectTeamNo(SqlSession session, int teamNo) {
        return session.selectOne("teamMapper.selectTeamNo", teamNo);
    }

    // 팀 신청 (일반 사용자)
    public int createTeam(SqlSession session, Team team) {
        return session.insert("teamMapper.createTeam", team);
    }

    // 팀 수정
    public int updateTeam(SqlSession session, Team team) {
        Map<String, Object> params = new HashMap<>();
        params.put("teamNo", team.getTeamNo()); // 팀 번호 추가
        params.put("teamName", team.getTeamName());
        params.put("teamArea", team.getTeamArea());

        return session.update("teamMapper.updateTeam", params); // SQL 쿼리 실행
    }
    public Team selectTeamByName(SqlSession session, String teamName) {
        return session.selectOne("teamMapper.selectTeamByName", teamName);
    }

    // 팀 삭제
    public int deleteTeam(SqlSession session, int teamNo) {
        return session.delete("teamMapper.deleteTeam", teamNo);
    }   
    // 팀 가입 신청
    public int insertPlayer(SqlSession session, int userNo, int teamNo) {
        Map<String, Integer> params = new HashMap<>();
        params.put("userNo", userNo);
        params.put("teamNo", teamNo);
        return session.insert("teamMapper.insertPlayer", params);
    }
    
    // cjs - 본인이 팀장인 팀 리스트 조회
    public List<Team> selectTeamListByUser(SqlSession session, int userNo) {
    	return session.selectList("teamMapper.selectTeamListByUser", userNo);
    }
    
    // cjs - 프론트에 넘겨주기 위해 팀 번호 기준으로 팀 객체 조회
    public Team selectTeamByTeamNo(SqlSession session, int teamNo) {
    	return session.selectOne("teamMapper.selectTeamByTeamNo", teamNo);
    }
}


