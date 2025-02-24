package com.gn.field.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.vo.Field;

public class FieldDao {
	public int insertField(SqlSession session, Field field) {
		return session.insert("fieldMapper.insertFieldOne", field);
	}
}
