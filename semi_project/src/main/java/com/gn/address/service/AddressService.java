package com.gn.address.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.address.dao.AddressDao;
import com.gn.address.vo.Address;

public class AddressService {
	public List<Address> selectAddr1All() {
		SqlSession session = getSqlSession(true);
		List<Address> addr1List = new AddressDao().selectAddr1All(session);
		session.close();
		return addr1List;
	}
	
	public List<Address> selectAddr2All(String addr1) {
		SqlSession session = getSqlSession(true);
		List<Address> addr2List = new AddressDao().selectAddr2All(session, addr1);
		session.close();
		return addr2List;
	}
}
