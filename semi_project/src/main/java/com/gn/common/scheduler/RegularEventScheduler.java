package com.gn.common.scheduler;

import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.gn.rule.service.PlanRuleService;
import com.gn.rule.vo.PlanRule;

public class RegularEventScheduler implements Job {
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		// 정기적으로 수행하고 싶은 작업 작성
		
		// 1. 모든 유저의 등록 규칙을 SELECT 해서 리스트 형태로 만들어둬아함 - 누가 로그인했냐와 무관함
		System.out.println("RegularEventScheduler : 스케줄러 정상 작동 중입니다.");
		
		List<PlanRule> list = new PlanRuleService().selectPlanRuleAll();
		
		if(list != null && list.size() != 0) {
			System.out.println("RegularEventScheduler : 리스트가 null이 아닙니다.");
			
			/* plan_rule 테이블에 데이터가 있는 경우 */
			System.out.println("RegularEventScheduler : "+list);
			
			for(PlanRule pr : list) {
				System.out.println("RegularEventScheduler : "+pr);
				int fieldNo = pr.getFieldNo();
				String planDate = "오늘+7일";
				
				String openTime = pr.getOpenTime();
				String closeTime = pr.getCloseTime();

				String operating = pr.getOperating();
				
				String price = pr.getPrice();
				
				System.out.println(fieldNo + "," + planDate + "," + openTime + "," + closeTime + "," + operating + "," + price);
			}
			
			
			
			
			
		} else {
			System.out.println("RegularEventScheduler : 리스트가 null입니다.");
			/* plan_rule 테이블에 데이터가 없는 경우 - 아무도 규칙을 등록하지 않은 상태 */
			
			// 아무 동작도 필요하지 않음
			System.out.println("RegularEventScheduler : 스케줄러는 아무런 동작도 하지 않을 것입니다.");
		}

	}
}