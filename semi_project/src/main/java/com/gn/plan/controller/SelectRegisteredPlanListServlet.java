package com.gn.plan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.plan.service.PlanService;
import com.gn.plan.vo.PagingPlan;
import com.gn.plan.vo.Plan;
import com.gn.user.vo.User;


@WebServlet("/selectRegisteredPlanList")
public class SelectRegisteredPlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectRegisteredPlanListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 일정번호, 구장이름, 일정날짜, 일정시간, 이용시간 가져올것임
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("user") != null) {
			User user = (User)session.getAttribute("user");
			int userNo = user.getUserNo();
			
			String nowPageParam = request.getParameter("nowPage");
			int nowPage = (nowPageParam != null) ? Integer.parseInt(nowPageParam) : 1;
            int numPerPage = 10;
            Plan option = new Plan();
            option.setUserNo(userNo);
            option.setNowPage(nowPage);
            option.setNumPerPage(numPerPage);
            int totalData = new PlanService().selectRegPlanCount(option);
            option.setTotalData(totalData);
            
			
			List<Plan> registeredPlanList = new PlanService().selelctRegisteredPlanList(option);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/plan/registeredPlanList.jsp");
			request.setAttribute("registeredPlanList", registeredPlanList);
			request.setAttribute("paging", option);
			view.forward(request, response);
		} else {
			System.out.println("SelectRegPlanList : 세션에 유저정보가 존재하지 않습니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
