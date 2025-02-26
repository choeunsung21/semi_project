package com.gn.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.team.vo.Team;



public class TeamDao {
	// 팀 생성
	public int insertTeam(SqlSession session ,Team team) {
		return session.insert("teamMapper.team",team);
	}
    // 보낸 팀 가입 신청 목록 조회
    public List<Team> sendTeamList(SqlSession session, int userNo) {
        return session.selectList("teamMapper.sendTeamList", userNo);
    }
 // 받은 팀 가입 신청 목록 조회
    public List<Team> receiveTeamList(SqlSession session, int userNo) {
        return session.selectList("teamMapper.receivedTeamList", userNo);
    }
	
}
