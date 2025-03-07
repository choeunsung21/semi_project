package com.gn.address.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.address.vo.Address;

public class AddressDao {
	public List<Address> selectAddr1All(SqlSession session) {
		return session.selectList("addressMapper.selectAddr1All");
	}
	
	public List<Address> selectAddr2All(SqlSession session, String addr2) {
		return session.selectList("addressMapper.selectAddr2All", addr2);
	}
}
