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


@WebServlet("/updatePlanEnd")
public class UpdatePlanEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdatePlanEndServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	// 세션확인
    	if(session != null && session.getAttribute("user") != null) {
    		// User user = (User)session.getAttribute("user");
    		// int userNo = user.getUserNo();
    		String temp = request.getParameter("plan_no");
    		int planNo = 0;
    		if(temp != null) {
    			planNo = Integer.parseInt(temp);
    		}
    		temp = request.getParameter("field_no");
    		int fieldNo = 0;
    		if(temp != null) {
    			fieldNo = Integer.parseInt(temp);
    		}
    		String planDate = request.getParameter("plan_date");
    		String planTime = request.getParameter("plan_time");
    		String planPrice = request.getParameter("plan_price");
    		String useTime = request.getParameter("use_time");
    		
    		Plan plan = Plan.builder()
    				.planNo(planNo)
    				.fieldNo(fieldNo)
    				.planDate(planDate)
    				.planTime(planTime)
    				.planPrice(planPrice)
    				.useTime(useTime)
    				.build();
    		
    		int result = new PlanService().updatePlan(plan);
    		
    		if(result > 0) {
    			RequestDispatcher view = request.getRequestDispatcher("/selectRegisteredPlanList");
    			view.forward(request, response);
    		} else {
    			System.out.println("UpdatePlanEnd : 수정 중 오류");
    		}
    		
    	} else {
    		request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
    	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
