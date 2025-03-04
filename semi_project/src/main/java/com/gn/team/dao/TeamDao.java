package com.gn.team.dao;

import java.util.List;
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

    // 받은 가입 신청 목록 조회 (팀장용)
    public List<Team> receiveTeamList(SqlSession session, int leaderNo) {
        return session.selectList("teamMapper.receiveTeamList", leaderNo);
    }

    // 보낸 신청 목록 (사용자용)
    public List<Team> sendTeamList(SqlSession session, int userNo) {
        return session.selectList("teamMapper.sendTeamList", userNo);
    }

    // 팀 수정
    public int updateTeam(SqlSession session, Team team) {
        return session.update("teamMapper.updateTeam", team);
    }

    // 팀 삭제
    public int deleteTeam(SqlSession session, int teamNo) {
        return session.delete("teamMapper.deleteTeam", teamNo);
    }
}


