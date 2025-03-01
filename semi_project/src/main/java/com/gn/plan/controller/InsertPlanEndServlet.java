package com.gn.plan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;

@WebServlet("/insertPlanEnd")
public class InsertPlanEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertPlanEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("field_no");
//		int fieldNo = 0;
//		if(temp != null)
//			fieldNo = Integer.parseInt(temp);
		int fieldNo = 1;
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
			// 일정 목록 만들어야함
			RequestDispatcher view = request.getRequestDispatcher("/views/plan/planList.jsp");
			request.setAttribute("plan", plan);
		} else {
			// 일정 등록 실패 페이지 만들어야함
			request.getRequestDispatcher("/views/plan/insertPlanFail.jsp");
		}
		System.out.println("일정 등록 성공 여부 : " + result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
