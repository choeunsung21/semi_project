package com.gn.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

// 팀 수정
@WebServlet("/updateTeam")
public class UpdateTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateTeamServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teamNoStr = request.getParameter("team_no");
	    
	    if (teamNoStr == null || teamNoStr.isEmpty()) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "팀 번호가 필요합니다.");
	        return;
	    }
	    
	    int teamNo = Integer.parseInt(teamNoStr);
	    String teamName = request.getParameter("team_name");
	    String teamArea = request.getParameter("team_area");
	    String teamLevelStr = request.getParameter("team_level"); // String 형태로 받음

	    Integer teamLevel = null;
	    if (teamLevelStr != null && !teamLevelStr.isEmpty()) {
	        teamLevel = Integer.parseInt(teamLevelStr); // Integer로 변환
	    }

	    String teamCountStr = request.getParameter("team_count");

	    if (teamCountStr == null || teamCountStr.isEmpty()) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "팀원 수가 필요합니다.");
	        return;
	    }

	    int teamCount = Integer.parseInt(teamCountStr);

	    // 팀 수정 로직 추가
	    Team team = new Team();
	    team.setTeamNo(teamNo);
	    team.setTeamName(teamName);
	    team.setTeamArea(teamArea);
	    team.setTeamLevel(teamLevel); // Integer 타입으로 설정
	    team.setTeamCount(teamCount);

	    TeamService teamService = new TeamService();
	    boolean isUpdated = teamService.updateTeam(team);

	    if (isUpdated) {
	        response.sendRedirect("views/team/teamList.jsp");
	    } else {
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "수정 실패");
	    }
	}
}

