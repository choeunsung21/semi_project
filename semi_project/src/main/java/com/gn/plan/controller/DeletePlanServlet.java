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


@WebServlet("/deletePlan")
public class DeletePlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeletePlanServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	// 세션확인
    	if(session != null && session.getAttribute("user") != null) {
    		// 세션 유저정보 get
    		// User user = (User)session.getAttribute("user");
    		// int userNo = user.getUserNo();
    		
    		String temp = request.getParameter("planNo");
    		int planNo = 0;
    		if(temp != null)
    			planNo = Integer.parseInt(temp);
    		Plan plan = new Plan();
    		plan.setPlanNo(planNo);
    		
    		int result = new PlanService().deletePlan(plan);
    		System.out.println("deletePlanServlet : " + result);
    		if(result != 0) {
    			response.sendRedirect("/selectRegisteredPlanList");
    		} else {
    			RequestDispatcher view = request.getRequestDispatcher("/views/plan/deleteFail.jsp");
    			view.forward(request, response);
    		}
    	} else {
    		request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
    	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
