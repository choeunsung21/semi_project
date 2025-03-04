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
	
	public List<PlanRule> selectPlanRuleByPlanRule(SqlSession session, PlanRule option) {
		List<PlanRule> resultList = session.selectList("planRuleMapper.selectPlanRuleByPlanRule", option);
		return resultList;
	}
	
	public int selectPlanRuleCount(SqlSession session, PlanRule planRule) {
		return session.selectOne("planRuleMapper.selectPlanRuleCount", planRule);
	}
	
	public int insertPlanRule(SqlSession session, PlanRule planRule) {
		return session.insert("planRuleMapper.insertPlanRule", planRule);
	}
	
	public int deletePlanRuleByRuleNo(SqlSession session, int ruleNo) {
		return session.delete("planRuleMapper.deletePlanRuleByRuleNo", ruleNo);
	}
	
	public PlanRule selectPlanRuleByFieldNo(SqlSession session, int fieldNo) {
		return session.selectOne("planRuleMapper.selectPlanRuleByFieldNo", fieldNo);
	}
	
	public PlanRule selectPlanRuleByRuleNo(SqlSession session, int ruleNo) {
		return session.selectOne("planRuleMapper.selectPlanRuleByRuleNo", ruleNo);
	}
}
