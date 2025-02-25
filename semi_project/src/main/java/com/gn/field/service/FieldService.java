package com.gn.field.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.gn.dayoff.dao.DayoffDao;
import com.gn.dayoff.vo.Dayoff;
import com.gn.field.dao.FieldDao;
import com.gn.field.vo.Field;

public class FieldService {
	public int insertField(Field field) {
		SqlSession session = getSqlSession(false);
		
		int result = 0;
		int resultInsertDayoff = 0;
		int resultInsertField = 0;
	
		resultInsertDayoff = new DayoffDao().insertDayoff(session, field);
		
		if(resultInsertDayoff > 0) {
			Dayoff dayoff = new FieldDao().selectDayoff(session);
			
			if(dayoff != null) {
				int tmp = dayoff.getDayoffNo();
				field.setDayoffNo(tmp);
				
				resultInsertField = new FieldDao().insertField(session, field);
				
				if(resultInsertDayoff > 0 && resultInsertField > 0) {
					result = 1;
					session.commit();
				} else {
					session.rollback();
				}
			}
		}
		
		session.close();
		
		return result;
	}
}
