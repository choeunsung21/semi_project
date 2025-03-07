package com.gn.reservation.controller;

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


@WebServlet("/deleteReservation")
public class DeleteReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteReservationServlet() {
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
			
			Reservation reservation = Reservation.builder()
					.userNo(userNo)
					.planNo(planNo)
					.build();
			
			reservation = new ReservationService().selectReservationDetail(reservation);
			
			int result = new ReservationService().deleteReservation(reservation);
			if(result > 0) {
				int resStatus = 0; // 예약상태 변경
				Plan plan = Plan.builder()
						.planNo(planNo)
						.resStatus(resStatus)
						.build();
				new PlanService().updatePlanStatus(plan);
				// 성공시 홈페이지 이동
				RequestDispatcher view = request.getRequestDispatcher("/selectPlanList");
				request.setAttribute("reservation", reservation);
				view.forward(request, response);
			} else {
				// 실패시 페이지 만들어야함
				request.getRequestDispatcher("/views/reservation/deleteFail.jsp");
			}
		} else {
			request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
