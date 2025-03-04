package com.gn.plan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;
import com.gn.reservation.service.ReservationService;
import com.gn.reservation.vo.Reservation;
import com.gn.user.vo.User;


@WebServlet("/selectPlanDetail")
public class SelectPlanDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectPlanDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		// 세션확인
		int userNo = 0;
		if(session != null && session.getAttribute("user") != null) {
			User user = (User)session.getAttribute("user");
			userNo = user.getUserNo();
		}
		
		String temp = request.getParameter("planNo");
		int planNo = 0;
		if(temp != null)
			planNo = Integer.parseInt(temp);
		
		Plan plan = new PlanService().selectPlanDetail(planNo);
		Reservation reservation = Reservation.builder()
				.userNo(userNo)
				.planNo(planNo)
				.build();
		
		reservation = new ReservationService().selectReservationDetail(reservation);
		RequestDispatcher view = request.getRequestDispatcher("/views/plan/planDetail.jsp");
		request.setAttribute("plan", plan);
		request.setAttribute("reservation", reservation);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
