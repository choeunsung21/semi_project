package com.gn.plan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;


@WebServlet("/selectAllPlanByDate")
public class SelectAllPlanByDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectAllPlanByDateServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String planDate = request.getParameter("planDate");
		
		List<Plan> planList = new PlanService().selectAllPlanByDate(planDate);
		System.out.println(planList);
		
		// 구장위치, 구장명, 일정날짜, 일정시간, 이용시간, 예약상태
		JSONArray jsonArray = new JSONArray();
		for (Plan p : planList) {
		    JSONObject obj = new JSONObject();
		    obj.put("planNo", p.getPlanNo());
		    obj.put("fieldAddr2", p.getField().getFieldAddr2());
		    obj.put("fieldName", p.getField().getFieldName());
		    obj.put("planDate", p.getPlanDate());
		    obj.put("planTime", p.getPlanTime());
		    obj.put("useTime", p.getUseTime());
		    obj.put("resStatus", p.getResStatus());
		    jsonArray.add(obj);
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jsonArray.toJSONString());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
