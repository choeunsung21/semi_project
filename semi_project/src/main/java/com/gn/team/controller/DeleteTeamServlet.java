package com.gn.team.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;

// 팀 삭제
@WebServlet("/deleteTeam")
public class DeleteTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteTeamServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int teamNo = Integer.parseInt(request.getParameter("teamNo"));
        // 팀 삭제 로직 추가
        TeamService teamService = new TeamService();
        boolean isDeleted = teamService.deleteTeam(teamNo); // 팀 삭제 메서드 호출

        if (isDeleted) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}