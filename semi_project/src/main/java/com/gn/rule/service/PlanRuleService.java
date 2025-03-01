package com.gn.rule.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.rule.dao.PlanRuleDao;
import com.gn.rule.vo.PlanRule;

public class PlanRuleService {
	public List<PlanRule> selectPlanRuleAll() {
		SqlSession session = getSqlSession(true);
		System.out.println("PlanRuleService : 이쪽으로 데이터 넘어옴");
		List<PlanRule> resultList = new PlanRuleDao().selectPlanRuleAll(session);
		System.out.println("PlanRuleService : 리스트 조회되어서 Dao에서 넘어옴");
		session.close();
		return resultList;
	}
}
