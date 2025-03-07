package com.gn.user.myPageController;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.gn.plan.vo.Plan;
import com.gn.user.service.UserService;
import com.gn.user.vo.User;

@WebServlet("/MyPageReservationServlet")
public class MyPageReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MyPageReservationServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			response.sendRedirect("/login.jsp");
			return;
		}
		
		List<Plan> planList = new UserService().selectPlanByUse(user.getUserNo());
		
		JSONArray arr = new JSONArray();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		for(Plan list : planList) {
			JSONObject obj = new JSONObject();
			obj.put("planNo",list.getPlanNo());
			obj.put("fieldAddr",list.getField().getFieldAddr());
			obj.put("fieldName",list.getField().getFieldName());
			obj.put("planDate", list.getPlanDate());
			obj.put("planTime", list.getPlanTime());
			obj.put("useTime", list.getUseTime());
			obj.put("regDate", list.getRegDate().format(dtf));
			arr.add(obj);
		}
		JSONObject obj1 = new JSONObject();
		obj1.put("list", arr);
		System.out.println(obj1);
			
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(obj1.toString());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
