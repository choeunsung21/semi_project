package com.gn.reservation.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gn.field.service.FieldService;
import com.gn.field.vo.Field;
import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;
import com.gn.reservation.service.ReservationService;
import com.gn.reservation.vo.Reservation;
import com.gn.user.vo.User;

@WebServlet("/insertReservation")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertReservationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		// 세션확인
		if(session != null && session.getAttribute("user") != null) {
			User user = (User)session.getAttribute("user");
			
			int userNo = user.getUserNo();
			String temp = request.getParameter("planNo");
			int planNo = 0;
			if(temp != null)
				planNo = Integer.parseInt(temp);

			Reservation reservation = Reservation
					.builder()
					.userNo(userNo)
					.planNo(planNo)
					.build();

			int result = new ReservationService().insertReservation(reservation);
			if (result > 0) {
				int resStatus = 1; // 예약상태 변경
				Plan plan = Plan.builder()
						.planNo(planNo)
						.resStatus(resStatus)
						.build();
				new PlanService().updatePlanStatus(plan);
				// 성공 시 예약 상세 페이지로 이동
				// 상세 페이지 만들긴 했으나 해당 예약에 맞는 페이지로 이동하는지는 아직 테스트 불가
				RequestDispatcher view = request.getRequestDispatcher("/selectPlanDetail");
				request.setAttribute("reservation_info", reservation);
				view.forward(request, response);
			} else {
				// 실패 시 에러 페이지로 이동 (만들어야 함)
				request.getRequestDispatcher("/views/reservation/reservationFail.jsp").forward(request, response);
			}
			
		} else {
			// 현재세션에 유저정보 없을 시(비로그인상태) 로그인 페이지로 이동
			request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
