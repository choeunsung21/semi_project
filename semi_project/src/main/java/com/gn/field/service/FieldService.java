package com.gn.field.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.dao.DayoffDao;
import com.gn.field.dao.FieldDao;
import com.gn.field.vo.Dayoff;
import com.gn.field.vo.Field;
import com.gn.field.vo.FieldAttach;
import com.gn.user.vo.User;

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
	
	public List<Field> selectFieldListByUser(User user) {
		SqlSession session = getSqlSession(true);
		List<Field> fieldList = new FieldDao().selectFieldListByUser(session, user);
		session.close();
		return fieldList;
	}
	
	public int selectFieldCount(Field field) {
		SqlSession session = getSqlSession(true);
		int count = new FieldDao().selectFieldCount(session, field);
		session.close();
		return count;
	}
	
	public List<Field> selectFieldByField(Field option) {
		SqlSession session = getSqlSession(true);
		List<Field> resultList = new FieldDao().selectFieldListByField(session, option);
		session.close();
		return resultList;
	}
	
	public Field selectFieldOneByFieldNo(int fieldNo) {
		SqlSession session = getSqlSession(true);
		Field result = new FieldDao().selectFieldOneByFieldNo(session, fieldNo);
		session.close();
		return result;
	}
	
	public int deleteFieldByFieldNo(int fieldNo) {
		SqlSession session = getSqlSession(true);
		int result = new FieldDao().deleteFieldByFieldNo(session, fieldNo);
		session.close();
		return result;
	}
}
