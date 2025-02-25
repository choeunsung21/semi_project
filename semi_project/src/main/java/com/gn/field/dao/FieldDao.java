package com.gn.field.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.dayoff.vo.Dayoff;
import com.gn.field.vo.Field;

public class FieldDao {
	public int insertField(SqlSession session, Field field) {
		return session.insert("fieldMapper.insertFieldOne", field);
	}
	
	public Dayoff selectDayoff(SqlSession session) {
		return session.selectOne("dayoffMapper.selectDayoffOne");
	}
}
