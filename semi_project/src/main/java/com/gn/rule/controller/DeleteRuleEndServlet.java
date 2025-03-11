package com.gn.rule.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.rule.service.PlanRuleService;

@WebServlet("/deletePlanRuleEnd")
public class DeleteRuleEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteRuleEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String planRuleNo = request.getParameter("planRuleNo");
		
		if(planRuleNo != null) {
			int ruleNo = Integer.parseInt(planRuleNo);
			
			int result = new PlanRuleService().deletePlanRuleByRuleNo(ruleNo);
			
			if(result > 0) {
				RequestDispatcher view = request.getRequestDispatcher("/views/rule/deleteRule_success.jsp");
				view.forward(request, response);
			}
			
		} else {
			/* 
			 * planRuleNo에 올바른 값이 넘어오지 않는 경우임
			 * 다른 페이지로 넘기기 때문에 이쪽으로 올 수 없음
			 */ 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
