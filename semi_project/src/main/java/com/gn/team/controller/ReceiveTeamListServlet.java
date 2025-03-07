package com.gn.team.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.team.service.TeamService;
import com.gn.team.vo.Team;

// 받은 가입신청 목록
@WebServlet("/receiveTeam")
public class ReceiveTeamListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ReceiveTeamListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/views/team/receiveTeam.jsp");
		view.forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
