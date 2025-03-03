package com.gn.rule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.rule.vo.PlanRule;
import com.gn.user.vo.User;

public class PlanRuleDao {
	public List<PlanRule> selectPlanRuleAll(SqlSession session) {
		List<PlanRule> resultList = session.selectList("planRuleMapper.selectPlanRuleAll");
		return resultList;
	}
	
	public List<PlanRule> selectPlanRuleByUser(SqlSession session, User user) {
		List<PlanRule> resultList = session.selectList("planRuleMapper.selectPlanRuleByUser", user);
		return resultList;
	}
	
	public int insertPlanRule(SqlSession session, PlanRule planRule) {
		return session.insert("planRuleMapper.insertPlanRule", planRule);
	}
	
	public PlanRule selectPlanRuleByFieldNo(SqlSession session, int fieldNo) {
		return session.selectOne("planRuleMapper.selectPlanRuleByFieldNo", fieldNo);
	}
}
