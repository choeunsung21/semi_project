package com.gn.reservation.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.reservation.vo.Reservation;

public class ReservationDao {

	public int insertReservation(SqlSession session, Reservation reservation) {
		return session.insert("reservationMapper.insertReservationOne", reservation);
	}
}
