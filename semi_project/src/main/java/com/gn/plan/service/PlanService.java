package com.gn.plan.service;

import static com.gn.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gn.plan.dao.PlanDao;
import com.gn.plan.vo.Plan;

public class PlanService {

	public int InsertPlan(Plan plan) {
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

}
