package com.gn.rule.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.rule.dao.PlanRuleDao;
import com.gn.rule.vo.PlanRule;
import com.gn.user.vo.User;

public class PlanRuleService {
	public List<PlanRule> selectPlanRuleAll() {
		SqlSession session = getSqlSession(true);
		List<PlanRule> resultList = new PlanRuleDao().selectPlanRuleAll(session);
		session.close();
		return resultList;
	}

	public List<PlanRule> selectPlanRuleByPlanRule(PlanRule option) {
		SqlSession session = getSqlSession(true);
		List<PlanRule> resultList = new PlanRuleDao().selectPlanRuleByPlanRule(session, option);
		session.close();
		return resultList;
	}
	
	public int selectPlanRuleCount(PlanRule planRule) {
		SqlSession session = getSqlSession(true);
		int count = new PlanRuleDao().selectPlanRuleCount(session, planRule);
		session.close();
		return count;
	}
	
	public int insertPlanRule(PlanRule planRule) {
		SqlSession session = getSqlSession(true);
		int result = new PlanRuleDao().insertPlanRule(session, planRule);
		session.close();
		return result;
	}
	
	public int updatePlanRuleByRuleNo(PlanRule planRule) {
		SqlSession session = getSqlSession(true);
		int result = new PlanRuleDao().updatePlanRuleByRuleNo(session, planRule);
		session.close();
		return result;
	}
	
	public int updateStatus(int ruleNo) {
		SqlSession session = getSqlSession(true);
		int result = new PlanRuleDao().updateStatus(session, ruleNo);
		session.close();
		return result;
	}
	
	public int deletePlanRuleByRuleNo(int ruleNo) {
		SqlSession session = getSqlSession(true);
		int result = new PlanRuleDao().deletePlanRuleByRuleNo(session, ruleNo);
		session.close();
		return result;
	}
	
	public PlanRule selectRuleOneByFieldNo(int fieldNo) {
		SqlSession session = getSqlSession(true);
		PlanRule result = new PlanRuleDao().selectPlanRuleByFieldNo(session, fieldNo);
		session.close();
		return result;
	}
	
	public PlanRule selectRuleOneByRuleNo(int ruleNo) {
		SqlSession session = getSqlSession(true);
		PlanRule result = new PlanRuleDao().selectPlanRuleByRuleNo(session, ruleNo);
		session.close();
		return result;
	}
}
