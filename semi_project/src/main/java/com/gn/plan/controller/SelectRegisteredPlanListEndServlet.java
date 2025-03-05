package com.gn.plan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gn.reservation.service.ReservationService;
import com.gn.reservation.vo.Reservation;


@WebServlet("/selectRegisteredPlanListEnd")
public class SelectRegisteredPlanListEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectRegisteredPlanListEndServlet() {
        super();
    }

    @SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = "";
		String temp = request.getParameter("ajax_planNo");
		int planNo = 0;
		if(temp != null) {
			planNo = Integer.parseInt(temp);
		}
		
		JSONObject obj = new JSONObject();
		
		Reservation reservation = new ReservationService().selectReservationByPlanNo(planNo);
		if(reservation != null) {
			status = "예약";
		} else {
			status = "없음";
		}
		obj.put("status", status);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
