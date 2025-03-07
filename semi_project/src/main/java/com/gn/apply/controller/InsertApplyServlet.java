package com.gn.apply.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 가입 신청
@WebServlet("/insertApply")
public class InsertApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertApplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String userNoParam = request.getParameter("user_no");
//		String teamNoParam = request.getParameter("team_no");
//		request.setAttribute(userNoParam, teamNoParam);
		// apply 객체 생성 예정
		// setAttribut 작성 예정
		RequestDispatcher view = request.getRequestDispatcher("/views/apply/insertApply.jsp");
		view.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}


