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

	    public boolean updateTeam(Team team) {
	        SqlSession session = getSqlSession(true);
	        int result = new TeamDao().updateTeam(session, team);
	        session.close();
	        return result > 0;
	    }

	    public boolean deleteTeam(int teamId) {
	        SqlSession session = getSqlSession(true);
	        int result = new TeamDao().deleteTeam(session, teamId);
	        session.close();
	        return result > 0;
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

	    public List<Team> receiveTeamList(int leaderNo) {
	        SqlSession session = getSqlSession(true);
	        List<Team> resultList = new TeamDao().receiveTeamList(session, leaderNo);
	        session.close();
	        return resultList;
	    }

	    public List<Team> sendTeamList(int userNo) {
	        SqlSession session = getSqlSession(true);
	        List<Team> resultList = new TeamDao().sendTeamList(session, userNo);
	        session.close();
	        return resultList;
	    }
	}



		
		
	




