package com.gn.team.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

// 팀 목록 상세 페이지
@WebServlet("/teamDetail")
public class TeamDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TeamDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String teamNoStr = request.getParameter("team_no");

	        if (teamNoStr == null || teamNoStr.isEmpty()) {
	            response.sendRedirect("/teamList");
	            return;
	        }
	        int teamNo;
	        try {
	            teamNo = Integer.parseInt(teamNoStr);
	        } catch (NumberFormatException e) {
	            response.sendRedirect("/teamList");
	            return;
	        }
	        TeamService teamService = new TeamService();
	        Team team = teamService.selectTeamNo(teamNo);

	        // 팀 정보가 없으면 목록으로 리다이렉트
	        if (team == null) {
	            response.sendRedirect("/teamList");
	            return;
	        }
	        
	        RequestDispatcher view = request.getRequestDispatcher("/views/team/teamDetail.jsp");
	        request.setAttribute("team", team);
	        view.forward(request, response);
	    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
