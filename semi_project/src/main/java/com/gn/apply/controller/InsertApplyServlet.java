package com.gn.apply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.apply.service.ApplyService;
import com.gn.apply.vo.Apply;

// 가입 신청
@WebServlet("/insertApply")
public class InsertApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertApplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teamNoStr = request.getParameter("teamNo");

		// 로그인 체크 제거 (이미 로그인된 상태 가정)
		if (teamNoStr == null || teamNoStr.trim().isEmpty()) {
		    request.getSession().setAttribute("message", "팀 번호가 유효하지 않습니다.");
		    response.sendRedirect(request.getContextPath() + "/views/team/error.jsp");
		    return;
		}

		int teamNo = Integer.parseInt(teamNoStr);
		request.setAttribute("teamNo", teamNo);
		request.getRequestDispatcher("/views/apply/insertApply.jsp").forward(request, response);
		}
	}

