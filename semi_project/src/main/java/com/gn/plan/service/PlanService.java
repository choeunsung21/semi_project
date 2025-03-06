package com.gn.plan.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.plan.dao.PlanDao;
import com.gn.plan.vo.Plan;
import com.gn.user.vo.User;

public class PlanService {

	public int insertPlan(Plan plan) {
		SqlSession session = getSqlSession(true);
		int result = new PlanDao().insertPlan(session, plan);
		session.close();
		return result;
	}

	public List<Plan> selelctRegisteredPlanList(Plan plan) {
		SqlSession session = getSqlSession(true);
		List<Plan> planList = new PlanDao().selectRegisteredPlanList(session, plan);
		session.close();
		return planList;
	}

	public Plan selectPlanDetail(int planNo) {
		SqlSession session = getSqlSession(true);
		Plan plan = new PlanDao().selectPlanDetail(session, planNo);
		session.close();
		return plan;
	}

	public int deletePlan(Plan plan) {
		SqlSession session = getSqlSession(true);
		int result = new PlanDao().deletePlan(session, plan);
		session.close();
		return result;
	}

	public int selectRegPlanCount(Plan option) {
		SqlSession session = getSqlSession(true);
		int result = new PlanDao().selectRegPlanCount(session, option);
		session.close();
		return result;
	}

	public List<Plan> selectPlanList(Plan option) {
		SqlSession session = getSqlSession(true);
		List<Plan> planList = new PlanDao().selectPlanList(session, option);
		session.close();
		return planList;
	}

	public int selectPlanCount(Plan option) {
		SqlSession session = getSqlSession(true);
		int result = new PlanDao().selectPlanCount(session, option);
		session.close();
		return result;
	}

	public int updatePlan(Plan plan) {
		SqlSession session = getSqlSession(true);
		int result = new PlanDao().updatePlan(session, plan);
		session.close();
		return result;
	}

}
