package com.gn.field.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.field.vo.Dayoff;
import com.gn.field.vo.Field;
import com.gn.field.vo.FieldAttach;
import com.gn.user.vo.User;

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
	
	public Field selectFieldOneByFieldNo(SqlSession session, int fieldNo) {
		return session.selectOne("fieldMapper.selectFieldOneByFieldNo", fieldNo);
	}
	
	public int selectFieldCount(SqlSession session, Field field) {
		return session.selectOne("fieldMapper.selectFieldCount", field);
	}
	
	public int insertFieldAttach(SqlSession session, FieldAttach attach) {
		return session.insert("fieldAttachMapper.insertAttachOne", attach);
	}
	
	public List<Field> selectFieldListByUser(SqlSession session, User user) {
		return session.selectList("fieldMapper.selectFieldList", user);
	}
	
	public List<Field> selectFieldListByField(SqlSession session, Field option) {
		List<Field> resultList = session.selectList("fieldMapper.selectFieldByField", option);
		return resultList;
	}
	
	public int updateField(SqlSession session, Field field) {
		return session.update("fieldMapper.updateField", field);
	}
	
	public int deleteFieldByField(SqlSession session, Field field) {
		return session.delete("fieldMapper.deleteFieldByField", field);
	}
}
