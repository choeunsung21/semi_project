package com.gn.plan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;
import com.gn.user.vo.User;


@WebServlet("/selectPlanByDate")
public class SelectPlanByDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectPlanByDateServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	// 세션확인
    	if(session != null && session.getAttribute("user") != null) {
    		User user = (User)session.getAttribute("user");
    		int userNo = user.getUserNo();
    		
    		String planDate = request.getParameter("planDate");
    		
    		Plan plan = Plan.builder()
    				.userNo(userNo)
    				.planDate(planDate)
    				.build();
    		
    		List<Plan> planList = new PlanService().selectPlanByDate(plan);
    		
    		JSONArray jsonArray = new JSONArray();
    		for (Plan p : planList) {
    		    JSONObject obj = new JSONObject();
    		    obj.put("planNo", p.getPlanNo());
    		    obj.put("fieldName", p.getField().getFieldName());
    		    obj.put("planDate", p.getPlanDate());
    		    obj.put("planTime", p.getPlanTime());
    		    obj.put("useTime", p.getUseTime());
    		    obj.put("resStatus", p.getResStatus());
    		    jsonArray.add(obj);
    		}
    		response.setContentType("application/json; charset=UTF-8");
    		response.getWriter().print(jsonArray.toJSONString());

    	} else {
    		request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
