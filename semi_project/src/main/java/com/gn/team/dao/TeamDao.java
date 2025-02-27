package com.gn.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.gn.team.vo.Team;

public class TeamDao {
	 public int insertTeam(SqlSession session, Team team) {
	        return session.insert("teamMapper.insertTeam", team);
	    }
	 
	 public List<Team> receiveTeamListServlet() {
	    SqlSession session = getSqlSession();
	    List<Team> receivedRequests = null;
	        try {
	            receivedRequests = session.selectList("teamMapper.receiveTeamListServlet");
	        } finally {
	            session.close();
	        }
	        return receivedRequests;
	    }

	public List<Team> sendTeamListServlet() {
	    SqlSession session = getSqlSession();
	    List<Team> sentRequests = null;
	        try {
	            sentRequests = session.selectList("teamMapper.sendTeamListServlet");
	        } finally {
	            session.close();
	        }
	        return sentRequests;
	    }

	private SqlSession getSqlSession() {
			return null;
		}
	}
//    public int updateTeam(SqlSession session, Team team) {
//        return session.update("teamMapper.updateTeam", team);
//    }
//
//    public int deleteTeam(SqlSession session, int teamNo) {
//        return session.delete("teamMapper.deleteTeam", teamNo);
//    }
//}

