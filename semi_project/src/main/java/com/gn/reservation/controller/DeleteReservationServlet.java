package com.gn.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gn.reservation.service.ReservationService;
import com.gn.reservation.vo.Reservation;


@WebServlet("/deleteReservation")
public class DeleteReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteReservationServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("reservation_no");
		int reservationNo = 0;
		if(temp != null)
			reservationNo = Integer.parseInt(temp);
		Reservation reservation = new Reservation();
		reservation.setReservationNo(reservationNo);
		
		int result = new ReservationService().deleteReservation(reservation);
		System.out.println("예약삭제 여부 : " + result);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
