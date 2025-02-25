package com.gn.dayoff.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.vo.Field;

public class DayoffDao {
	public int insertDayoff(SqlSession session, Field field) {
		return session.insert("dayoffMapper.insertDayoffOne", field);
	}
}
