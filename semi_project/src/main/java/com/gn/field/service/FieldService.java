package com.gn.field.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.dao.FieldDao;
import com.gn.field.vo.Field;

public class FieldService {
	public int insertField(Field field) {
		SqlSession session = getSqlSession(true);
		
		int result = new FieldDao().insertField(session, field);
		session.close();
		
		return result;
	}
}
