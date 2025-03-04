package com.gn.rule.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatePlanRule")
public class UpdateRuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateRuleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ruleNo = request.getParameter("rule_no");
		System.out.println("UpdateRuleServlet : "+ruleNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/rule/updateRule.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
