package com.gn.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mariadb.jdbc.client.socket.impl.CompressOutputStream;

import com.gn.reservation.vo.Reservation;

public class ReservationDao {

	public int insertReservation(SqlSession session, Reservation reservation) {
		return session.insert("reservationMapper.insertReservationOne", reservation);
	}

	public int deleteReservation(SqlSession session, Reservation reservation) {
		return session.delete("reservationMapper.deleteReservationOne", reservation);
	}

	public Reservation selectReservationDetail(SqlSession session, Reservation reservation) {
		return session.selectOne("reservationMapper.selectReservationDetail", reservation);
	}

	
}
