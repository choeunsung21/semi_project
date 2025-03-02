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

@WebServlet("/insertRuleEnd")
public class InsertRuleEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertRuleEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 혹시 몰라서 null체크를 하지만, null이 들어올 수가 없는 구간임 - 프론트에서 1차적으로 막아둠
		String tmp = request.getParameter("field_no");
		int fieldNo = 0;
		if(tmp != null) {
			fieldNo = Integer.parseInt(tmp);
		}
		
		String openTime = request.getParameter("rule_open");
		String closeTime = request.getParameter("rule_close");
		
		String operating = request.getParameter("rule_usetime");
		String price = request.getParameter("rule_price");
		
		PlanRule planRule = PlanRule.builder()
				.fieldNo(fieldNo)
				.openTime(openTime)
				.closeTime(closeTime)
				.operating(operating)
				.price(price)
				.build();
						
		int result = new PlanRuleService().insertPlanRule(planRule);
		
		if(result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("/views/rule/insertRule_success.jsp");
			view.forward(request, response);
		} else {
			System.out.println("InsertRuleEndServlet : 정상적으로 등록이 되지 않은 상황");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
