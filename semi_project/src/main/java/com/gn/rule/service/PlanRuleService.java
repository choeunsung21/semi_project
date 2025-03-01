package com.gn.rule.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.rule.dao.PlanRuleDao;
import com.gn.rule.vo.PlanRule;

public class PlanRuleService {
	public List<PlanRule> selectPlanRuleAll() {
		SqlSession session = getSqlSession(true);
		List<PlanRule> resultList = new PlanRuleDao().selectPlanRuleAll(session);
		session.close();
		return resultList;
	}
}
