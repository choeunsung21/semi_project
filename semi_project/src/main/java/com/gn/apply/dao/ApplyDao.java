package com.gn.apply.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.apply.vo.Apply;

public class ApplyDao {
	public int insertApply(SqlSession session, Apply apply) {
        int result = session.insert("applyMapper.insertApply", apply);
        System.out.println("DEBUG: ApplyDao - Insert result: " + result);
        return result;
    }
   }
