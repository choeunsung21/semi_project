package com.gn.reservation.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.gn.reservation.dao.ReservationDao;
import com.gn.reservation.vo.Reservation;

public class ReservationService {

	public int insertReservation(Reservation reservation) {
		SqlSession session = getSqlSession(true);
		int result = new ReservationDao().insertReservation(session, reservation);
		session.close();
		return result;
	}

	public int deleteReservation(Reservation reservation) {
		SqlSession session = getSqlSession(true);
		int result = new ReservationDao().deleteReservation(session, reservation);
		session.close();
		return result;
	}

	public Reservation selectReservationDetail(Reservation reservation) {
		SqlSession session = getSqlSession(true);
		Reservation reservationDetail = new ReservationDao().selectReservationDetail(session, reservation);
		session.close();
		return reservationDetail;
	}

	public Reservation selectReservationByPlanNo(int planNo) {
		SqlSession session = getSqlSession(true);
		Reservation reservation = new ReservationDao().selectReservationByPlanNo(session, planNo);
		session.close();
		return reservation;
	}


}
