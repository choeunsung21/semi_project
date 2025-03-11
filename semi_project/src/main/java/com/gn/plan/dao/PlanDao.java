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

	public int updatePlan(SqlSession session, Plan plan) {
		return session.update("planMapper.updatePlan", plan);
	}

	public void updatePlanStatus(SqlSession session, Plan plan) {
		session.update("planMapper.updatePlanStatus", plan);
	}

	public List<Plan> selectPlanByDate(SqlSession session, Plan plan) {
		return session.selectList("planMapper.selectPlanByDate", plan);
	}
	
	public List<Plan> selectPlanListByFieldNo(SqlSession session, int fieldNo) {
		return session.selectList("planMapper.selectPlanListByFieldNo", fieldNo);
	}

	public List<Plan> selectAllPlanByDate(SqlSession session, String planDate) {
		return session.selectList("planMapper.selectAllPlanByDate", planDate);
	}

	public int deleteOldPlans(SqlSession session, String today) {
		return session.delete("planMapper.deleteOldPlans", today);
	}
	
}
