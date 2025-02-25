package com.gn.dayoff.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.dayoff.vo.Dayoff;

public class DayoffDao {
	public int insertDayoff(SqlSession session, Dayoff dayoff) {
		return session.insert("dayoffMapper.insertDayoffOne", dayoff);
	}
}
