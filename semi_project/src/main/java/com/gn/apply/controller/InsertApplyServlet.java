package com.gn.apply.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.user.vo.User;

// 가입 신청
@WebServlet("/insertApply")
public class InsertApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertApplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/* cjs 팀 신청 데이터 넘기는 과정 */
		
		String userNo = request.getParameter("userNo");
		String teamNo = request.getParameter("teamNo");
		
		RequestDispatcher view = request.getRequestDispatcher("/views/apply/insertApply.jsp");
		request.setAttribute("userNo", userNo);
		request.setAttribute("teamNo", teamNo);
		view.forward(request, response);
		
		/* cjs 팀 신청 데이터 넘기는 과정 */
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}


