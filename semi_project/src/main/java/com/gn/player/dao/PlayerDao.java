package com.gn.player.dao;

import org.apache.ibatis.session.SqlSession;

import com.gn.apply.vo.Apply;

public class PlayerDao {
	public int insertPlayer(SqlSession session, Apply apply) {
		return session.insert("playerMapper.insertPlayer", apply);
	}
}
