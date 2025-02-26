package com.gn.field.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.dao.DayoffDao;
import com.gn.field.dao.FieldDao;
import com.gn.field.vo.Dayoff;
import com.gn.field.vo.Field;
import com.gn.field.vo.FieldAttach;

public class FieldService {
	public int insertField(Field field, Dayoff dayoff, FieldAttach attach) {
		SqlSession session = getSqlSession(false);
		
		int result = 0;
		int resultInsertDayoff = 0;
		int resultInsertField = 0;
		int resultInsertFieldAttach = 0;
	
		resultInsertDayoff = new DayoffDao().insertDayoff(session, dayoff);
		
		if(resultInsertDayoff > 0) {
			Dayoff selectedDayoff = new FieldDao().selectDayoffRecent(session);
			
			if(dayoff != null) {
				int tmp = selectedDayoff.getDayoffNo();
				field.setDayoffNo(tmp);
				resultInsertField = new FieldDao().insertField(session, field);
				
				if(resultInsertField > 0) {
					Field selectedField = new FieldDao().selectFieldRecent(session);
					
					if(attach != null) {
						int temp = selectedField.getFieldNo();
						attach.setFieldNo(temp);
						
						resultInsertFieldAttach = new FieldDao().insertFieldAttach(session, attach);
						
						if(resultInsertFieldAttach > 0) {
							result = 1;
							session.commit();							
						} else {
							session.rollback();
						}
					}
				} else {
					session.rollback();
				}
			}
		} else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
}
