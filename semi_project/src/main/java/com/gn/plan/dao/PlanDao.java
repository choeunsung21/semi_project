package com.gn.plan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.plan.vo.Plan;

public class PlanDao {

	public int insertPlan(SqlSession session, Plan plan) {
		return session.insert("planMapper.insertPlanOne", plan);
	}

	public List<Plan> selectRegisteredPlanList(SqlSession session, Plan plan) {
		return session.selectList("planMapper.selectRegisteredPlanList", plan);
	}

}
