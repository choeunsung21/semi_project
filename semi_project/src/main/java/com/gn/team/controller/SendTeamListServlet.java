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

@WebServlet("/sendTeamList")
public class SendTeamListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendTeamListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		TeamService teamService = new TeamService();
//		 // 보낸 가입 신청 목록 조회
//        List<Team> sendTeamList = teamService.sendTeamListServlet();
//
//        request.setAttribute("sendTeamList", sendTeamList);
//        request.getRequestDispatcher("/views/team/sendTeamList.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
