package com.gn.rule.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.rule.service.PlanRuleService;
import com.gn.rule.vo.PlanRule;

@WebServlet("/updateRuleEnd")
public class UpdateRuleEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateRuleEndServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tmp = request.getParameter("rule_no");
		int ruleNo = 0;
		if(tmp != null) {
			ruleNo = Integer.parseInt(tmp);
		}

		String openTime = request.getParameter("rule_open");
		String closeTime = request.getParameter("rule_close");
		String operating = request.getParameter("rule_usetime");
		String price = request.getParameter("rule_price");

		
		PlanRule planRule = PlanRule.builder()
				.ruleNo(ruleNo)
				.openTime(openTime)
				.closeTime(closeTime)
				.operating(operating)
				.price(price)
				.build();
		
		int result = new PlanRuleService().updatePlanRuleByRuleNo(planRule);
		
		if(result > 0) {
			// 수정에 성공한 상황
			RequestDispatcher view = request.getRequestDispatcher("/views/rule/updateRule_success.jsp");
			view.forward(request, response);
		} else {
			// 수정에 실패한 상황 - 이쪽으로 넘어온다는 것은 대부분 DB와의 연결 서버문제일 것
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
