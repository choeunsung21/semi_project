package com.gn.apply.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.apply.vo.Apply;

public class ApplyDao {
	public int insertApply(SqlSession session, Apply apply) {
        int result = session.insert("applyMapper.insertApply", apply);
        return result;
    }
	
   }
