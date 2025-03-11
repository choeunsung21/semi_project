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
import com.gn.reservation.service.ReservationService;
import com.gn.reservation.vo.Reservation;
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
		
		//List<Plan> planList = new UserService().selectPlanByUse(user.getUserNo());
		List<Reservation> reservationList = new ReservationService().selectReservationByUserNo(user.getUserNo()); 
		
		//System.out.println(planList);
//		System.out.println(planList.get(24).getFieldName());
		JSONArray arr = new JSONArray();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		for(Reservation list : reservationList) {
			JSONObject obj = new JSONObject();
			obj.put("planNo",list.getPlan().getPlanNo());
			obj.put("fieldAddr",list.getField().getFieldAddr());
			obj.put("fieldName",list.getField().getFieldName());
			obj.put("planDate", list.getPlan().getPlanDate());
			obj.put("planTime", list.getPlan().getPlanTime());
			obj.put("useTime", list.getPlan().getUseTime());
			obj.put("regDate", list.getPlan().getRegDate().format(dtf));
			arr.add(obj);
		}
		JSONObject obj1 = new JSONObject();
		obj1.put("list", arr);
			
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(obj1.toString());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
