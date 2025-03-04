package com.gn.rule.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.field.service.FieldService;
import com.gn.field.vo.Field;
import com.gn.rule.service.PlanRuleService;
import com.gn.rule.vo.PlanRule;
import com.gn.user.vo.User;

@WebServlet("/updatePlanRule")
public class UpdateRuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateRuleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tmp = request.getParameter("rule_no");
		int ruleNo = 0;
		
		if(tmp != null) {
			// 규칙 목록 조회에서 들어올 것이기 때문에 반드시 null 값이 아님
			ruleNo = Integer.parseInt(tmp);
		}
		
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("user") != null) {
			/* 로그인 과정에서 만들어진 세션이 정상적으로 존재하는 경우 */
			PlanRule planRule = new PlanRuleService().selectRuleOneByRuleNo(ruleNo);

			RequestDispatcher view = request.getRequestDispatcher("/views/rule/updateRule.jsp");
			
			request.setAttribute("planRule", planRule);
			view.forward(request, response);
			
		} else {
			/* 
			 * 로그인 과정에서 만들어진 세션이 정상적으로 존재하지 않는 경우
			 * 이미 로그아웃, 세션만료 과정에서 처리가 이루어졌기 때문에 이 조건문 안에 들어올 수 없음   
			 */
			System.out.println("InsertRuleServlet : 세션에 유저정보가 존재하지 않습니다.");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
