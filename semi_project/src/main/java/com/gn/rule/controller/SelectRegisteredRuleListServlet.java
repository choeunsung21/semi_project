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

import com.gn.rule.service.PlanRuleService;
import com.gn.rule.vo.PlanRule;
import com.gn.user.vo.User;

@WebServlet("/selectRegisteredRuleList")
public class SelectRegisteredRuleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectRegisteredRuleListServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 유저정보 가져오기
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("user") != null) {
			/* 로그인 과정에서 만들어진 세션이 정상적으로 존재하는 경우 */
			User user = (User)session.getAttribute("user");
			String nowPage = request.getParameter("nowPage");
						
			PlanRule rule = new PlanRule();
			rule.setUserNo(user.getUserNo());
			
			System.out.println(rule);
			
			nowPage = "1";
			if(nowPage != null) {
				rule.setNowPage(Integer.parseInt(nowPage));
			}			
			int totalData = new PlanRuleService().selectPlanRuleCount(rule);
			System.out.println(totalData);
			
			rule.setTotalData(totalData);
			
			
			
			
			List<PlanRule> registeredRuleList = new PlanRuleService().selectPlanRuleByUser(user);
			
			/*
			 * 해당 유저가 등록한 규칙이 있는 경우 List<PlanRule> 객체가 전달
			 * 해당 유저가 등록한 규칙이 없는 경우 null 이 전달됨
			 */
			
			for(PlanRule pr : registeredRuleList) {
				if(pr.getOpenTime() != null) {
					int tmpOpen = Integer.parseInt(pr.getOpenTime());
					
					if(0 <= tmpOpen && tmpOpen < 10) {
						pr.setOpenTime("0"+tmpOpen+":00");
					} else {
						pr.setOpenTime(tmpOpen+":00");
					}
				}
				
				if(pr.getCloseTime() != null) {
					int tmpClose = Integer.parseInt(pr.getCloseTime());		
					
					if(0 <= tmpClose && tmpClose < 10) {
						pr.setCloseTime("0"+tmpClose+":00");
					} else {
						pr.setCloseTime(tmpClose+":00");
					}
				}
			}

			RequestDispatcher view = request.getRequestDispatcher("/views/rule/selectRegisteredRuleList.jsp");
			request.setAttribute("registeredPlanRuleList", registeredRuleList);
			view.forward(request, response);
			
		} else {
			/* 
			 * 로그인 과정에서 만들어진 세션이 정상적으로 존재하지 않는 경우
			 * 이미 로그아웃, 세션만료 과정에서 처리가 이루어졌기 때문에 이 조건문 안에 들어올 수 없음
			 */
			System.out.println("SelectFieldEndServlet : 세션에 유저정보가 존재하지 않습니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
