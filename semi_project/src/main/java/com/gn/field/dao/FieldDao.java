package com.gn.field.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.vo.Dayoff;
import com.gn.field.vo.Field;
import com.gn.field.vo.FieldAttach;

public class FieldDao {
	public int insertField(SqlSession session, Field field) {
		return session.insert("fieldMapper.insertFieldOne", field);
	}
	
	public Dayoff selectDayoffRecent(SqlSession session) {
		return session.selectOne("dayoffMapper.selectDayoffOneRecent");
	}
	
	public Field selectFieldRecent(SqlSession session) {
		return session.selectOne("fieldMapper.selectFieldOneRecent");
	}
	
	public int insertFieldAttach(SqlSession session, FieldAttach attach) {
		return session.insert("fieldAttachMapper.insertAttachOne", attach);
	}
}
