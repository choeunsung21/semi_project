package com.gn.plan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;


@WebServlet("/selectRegisteredPlanList")
public class SelectRegisteredPlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectRegisteredPlanListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 일정번호, 구장이름, 일정날짜, 일정시간, 이용시간
		String temp = request.getParameter("plan_no");
		int planNo = 0;
		if(temp != null) 
			planNo = Integer.parseInt(temp);
		String fieldName = request.getParameter("field_name");
		String planDate = request.getParameter("plan_date");
		String planTime = request.getParameter("plan_time");
		String useTime = request.getParameter("use_time");
		
		Plan plan = Plan
				.builder()
				.planNo(planNo)
				.fieldName(fieldName)
				.planDate(planDate)
				.planTime(planTime)
				.useTime(useTime)
				.build();
		
		List<Plan> registeredPlanList = new PlanService().selelctRegisteredPlanList(plan);
		request.setAttribute("registeredPlanList", registeredPlanList);
		RequestDispatcher view = request.getRequestDispatcher("/views/plan/selectRegisteredPlanList.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
