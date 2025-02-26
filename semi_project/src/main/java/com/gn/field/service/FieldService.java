package com.gn.field.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.dao.DayoffDao;
import com.gn.field.dao.FieldDao;
import com.gn.field.vo.Dayoff;
import com.gn.field.vo.Field;

public class FieldService {
	public int insertField(Field field, Dayoff dayoff) {
		SqlSession session = getSqlSession(false);
		
		int result = 0;
		int resultInsertDayoff = 0;
		int resultInsertField = 0;
	
		resultInsertDayoff = new DayoffDao().insertDayoff(session, dayoff);
		
		if(resultInsertDayoff > 0) {
			Dayoff selectedDayoff = new FieldDao().selectDayoff(session);
			
			if(dayoff != null) {
				int tmp = selectedDayoff.getDayoffNo();
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
