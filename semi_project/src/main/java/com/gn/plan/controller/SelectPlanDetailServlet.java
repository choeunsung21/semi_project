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


@WebServlet("/selectPlanDetail")
public class SelectPlanDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectPlanDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("planNo");
		int planNo = 0;
		if(temp != null)
			planNo = Integer.parseInt(temp);
		
		Plan plan = new PlanService().selectPlanDetail(planNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/plan/planDetail.jsp");
		request.setAttribute("plan", plan);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
