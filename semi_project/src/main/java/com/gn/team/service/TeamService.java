package com.gn.team.service;
import java.util.List;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;
import org.apache.ibatis.session.SqlSession;
import com.gn.team.dao.TeamDao;
import com.gn.team.vo.Team;

public class TeamService {

	    public int insertTeam(Team team) {
	        SqlSession session = getSqlSession(true);
	        int result = new TeamDao().insertTeam(session, team);
	        session.close();
	        return result;
	    }
	    
	    public int updateTeam(Team team) {
	        SqlSession session = getSqlSession(true); // 자동 커밋 활성화
	        int result = 0;

	        try {
	            result = new TeamDao().updateTeam(session, team);
	        } catch (Exception e) {
	            e.printStackTrace(); // 예외 발생 시 스택 트레이스를 출력
	            throw e; // 예외를 상위 호출자로 전달
	        } finally {
	            session.close(); // 세션 닫기
	        }
			return result;
	    }
	    public boolean deleteTeam(int teamId) {
	        SqlSession session = getSqlSession(true);
	        int result = new TeamDao().deleteTeam(session, teamId);
	        session.close();
	        return result > 0;
	    }

	    public Team selectTeamByName(String teamName) {
	        SqlSession session = getSqlSession(true);
	        Team team = null;

	        try {
	            team = new TeamDao().selectTeamByName(session, teamName);
	        } catch (Exception e) {
	            e.printStackTrace(); // 예외를 콘솔에 출력
	        } finally {
	            session.close();
	        }

	        return team;
	    }

	    public List<Team> selectTeamList(Team team) {
	        SqlSession session = getSqlSession(true);
	        int totalData = new TeamDao().selectTeamCount(session, team);
	        team.setTotalData(totalData);
	        List<Team> resultList = new TeamDao().selectTeamList(session, team);
	        session.close();
	        return resultList;
	    }

	    public int selectTeamCount(Team team) {
	        SqlSession session = getSqlSession(true);
	        int count = new TeamDao().selectTeamCount(session, team);
	        session.close();
	        return count;
	    }

	    public int createTeam(Team team) {
	        SqlSession session = getSqlSession(true);
	        int result = new TeamDao().createTeam(session, team);
	        session.close();
	        return result;
	    }
	    public Team selectTeamNo(int teamNo) {
	        SqlSession session = getSqlSession(true);
	        Team team = new TeamDao().selectTeamNo(session, teamNo);
	        session.close();
	        return team;
	    }
	    // 팀 가입 신청
	    public boolean insertPlayer(int userNo, int teamNo) {
	    	SqlSession session = getSqlSession(true); // 자동 커밋 활성화
	        int result = 0;

	        try {
	            result = new TeamDao().insertPlayer(session, userNo, teamNo);
	        } catch (Exception e) {
	            e.printStackTrace(); // 예외 발생 시 스택 트레이스를 출력
	            return false;
	        } finally {
	            session.close(); // 세션 닫기
	        }

	        return result > 0; // 삽입 성공 여부 반환
	    }
	    
	    // cjs - 본인이 팀장인 팀 리스트 조회
	    public List<Team> selectTeamListByUser(int userNo) {
	    	SqlSession session = getSqlSession(true);
	    	List<Team> teamList = new TeamDao().selectTeamListByUser(session, userNo);
	    	session.close();
	    	return teamList;
	    }
	    
	    // cjs - 프론트에 넘겨주기 위해 팀 번호 기준으로 팀 객체 조회
	    public Team selectTeamByTeamNo(int teamNo) {
	    	SqlSession session = getSqlSession(true);
	    	Team team = new TeamDao().selectTeamByTeamNo(session, teamNo);
	    	session.close();
	    	return team;
	    }
	    
	    // cjs - 프론트에 넘겨주기 위해 유저 번호 기준으로 내 팀 목록을 조회
	    public List<Team> selectMyTeamAll(int userNo) {
	    	SqlSession session = getSqlSession(true);
	    	List<Team> myTeamList = new TeamDao().selectMyTeamAll(session, userNo);
	    	session.close();
	    	return myTeamList;
	    }
}


