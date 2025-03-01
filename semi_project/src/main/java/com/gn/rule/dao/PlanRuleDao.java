package com.gn.rule.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.rule.vo.PlanRule;

public class PlanRuleDao {
	public List<PlanRule> selectPlanRuleAll(SqlSession session) {
		System.out.println("PlanRuleDao : 이쪽으로 데이터 넘어옴");
		List<PlanRule> resultList = session.selectList("planRuleMapper.selectPlanRuleAll");
		System.out.println("PlanRuleDao : 데이터 조회되어서 넘어옴");
		return resultList;
	}
}
