package com.gn.plan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;
import com.gn.user.vo.User;

@WebServlet("/insertPlanEnd")
public class InsertPlanEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertPlanEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		// 세션 확인
		if(session != null && session.getAttribute("user") != null) {
			// 세션 유저정보 get
			// User user = (User)session.getAttribute("user");
			
			String temp = request.getParameter("field_no");
			int fieldNo = 0;
			if(temp != null)
				fieldNo = Integer.parseInt(temp);
			String planDate = request.getParameter("plan_date");
			String planTime = request.getParameter("plan_time");
			String planPrice = request.getParameter("plan_price");
			String useTime = request.getParameter("use_time");
			
			Plan plan = Plan
					.builder()
					.fieldNo(fieldNo)
					.planDate(planDate)
					.planTime(planTime)
					.planPrice(planPrice)
					.useTime(useTime)
					.build();
			
			int result = new PlanService().insertPlan(plan);
			if (result > 0) {
				// 일정 등록 성공시 등록한일정 목록 페이지로 이동
				response.sendRedirect("/selectRegisteredPlanList");
			} else {
				// 일정 등록 실패 페이지 만들어야함
				request.getRequestDispatcher("/views/plan/insertPlanFail.jsp");
			}
		} else {
			request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
