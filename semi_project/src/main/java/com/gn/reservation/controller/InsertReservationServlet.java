package com.gn.reservation.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.reservation.service.ReservationService;
import com.gn.reservation.vo.Reservation;

@WebServlet("/insertReservation")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertReservationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// int userNo = Integer.parseInt(request.getParameter("user_no"));
		// int planNo = Integer.parseInt(request.getParameter("plan_no"));
		int userNo = 3;
		int planNo = 1;

		Reservation reservation = Reservation.builder().userNo(userNo).planNo(planNo).build();

		int result = new ReservationService().insertReservation(reservation);
		if (result > 0) {
			// 성공 시 예약 상세 페이지로 이동
			RequestDispatcher view = request.getRequestDispatcher("/views/reservation/reservationDetail.jsp");
			request.setAttribute("reservation_info", reservation);
			view.forward(request, response);
		} else {
			// 실패 시 에러 페이지로 이동
			request.getRequestDispatcher("/views/reservation/reservationFail.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
