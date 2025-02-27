package com.gn.field.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.vo.Dayoff;

public class DayoffDao {
	public int insertDayoff(SqlSession session, Dayoff dayoff) {
		return session.insert("dayoffMapper.insertDayoffOne", dayoff);
	}
}
