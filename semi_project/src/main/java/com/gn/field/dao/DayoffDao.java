package com.gn.field.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.vo.Dayoff;
import com.gn.field.vo.Field;

public class DayoffDao {
	public int insertDayoff(SqlSession session, Dayoff dayoff) {
		return session.insert("dayoffMapper.insertDayoffOne", dayoff);
	}
	public int updateDayoff(SqlSession session, Field field) {
		return session.update("dayoffMapper.updateDayoff", field);
	} 
	public int deleteDayoff(SqlSession session, Field field) {
		return session.delete("dayoffMapper.deleteDayoff", field);
	}
}
