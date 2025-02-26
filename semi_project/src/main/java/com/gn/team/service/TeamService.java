package com.gn.team.service;
import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.team.dao.TeamDao;
import com.gn.team.vo.Team;

public class TeamService {
	// 팀 생성
	public int insertTeam(Team team) {
		SqlSession session = getSqlSession(true);
		int result = new TeamDao().insertTeam(session,team);
		session.close();
		return result;
	}
	// 보낸 팀 가입 신청 목록 조회
	public List<Team> sendTeamList(int userNo){
		SqlSession session = getSqlSession(true);
		List<Team> teamList = new TeamDao().sendTeamList(session, userNo);
		session.close();
		return teamList;
	}
	// 받은 팀 가입 신청 목록 조회
    public List<Team> receiveTeamList(int teamNo) {
        SqlSession session = getSqlSession(true);
        List<Team> teamList = new TeamDao().receiveTeamList(session, teamNo);
        session.close();
        return teamList;
    }
}
