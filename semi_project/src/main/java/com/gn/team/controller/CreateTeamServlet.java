package com.gn.team.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 팀 가입 신청
@WebServlet("/createTeam")
public class CreateTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateTeamServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 팀 가입 신청 코드 더 추가할 예정
		// player 데이터베이스에 추가할 예정
		// team 객체 추가, setAttribute 추가
		RequestDispatcher view = request.getRequestDispatcher("/views/team/createTeam.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
