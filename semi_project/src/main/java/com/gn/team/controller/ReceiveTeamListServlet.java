package com.gn.team.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

@WebServlet("/receiveTeamList")
public class ReceiveTeamListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReceiveTeamListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TeamService teamService = new TeamService();
		 // 받은 가입 신청 목록 조회
        List<Team> receiveTeamList = teamService.receiveTeamListServlet();
        request.setAttribute("receiveTeamList", receiveTeamList);
        request.getRequestDispatcher("/views/team/receiveTeamList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
