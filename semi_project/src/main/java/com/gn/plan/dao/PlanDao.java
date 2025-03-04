package com.gn.plan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.plan.vo.Plan;
import com.gn.user.vo.User;

public class PlanDao {

	public int insertPlan(SqlSession session, Plan plan) {
		return session.insert("planMapper.insertPlanOne", plan);
	}

	public List<Plan> selectRegisteredPlanList(SqlSession session, Plan plan) {
		return session.selectList("planMapper.selectRegisteredPlanList", plan);
	}

	public Plan selectPlanDetail(SqlSession session, int planNo) {
		return session.selectOne("planMapper.selectPlanDetail", planNo);
	}

	public int deletePlan(SqlSession session, Plan plan) {
		return session.delete("planMapper.deletePlan", plan);
	}

	public int selectRegPlanCount(SqlSession session, Plan option) {
		return session.selectOne("planMapper.selectRegPlanCount", option);
	}

	public List<Plan> selectPlanList(SqlSession session, Plan option) {
		return session.selectList("planMapper.selectPlanList", option);
	}

	public int selectPlanCount(SqlSession session, Plan option) {
		return session.selectOne("planMapper.selectPlanListCount", option);
	}
	
}
