package com.gn.plan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;

@WebServlet("/selectPlanList")
public class SelectPlanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectPlanListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nowPageParam = request.getParameter("nowPage");
		int nowPage = (nowPageParam != null) ? Integer.parseInt(nowPageParam) : 1;
        int numPerPage = 20;
        Plan option = new Plan();
        option.setNowPage(nowPage);
        option.setNumPerPage(numPerPage);
        int totalData = new PlanService().selectPlanCount(option);
        option.setTotalData(totalData);
        
        List<Plan> planList = new PlanService().selectPlanList(option);
        
        RequestDispatcher view = request.getRequestDispatcher("/views/plan/planList.jsp");
        request.setAttribute("planList", planList);
		request.setAttribute("paging", option);
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
