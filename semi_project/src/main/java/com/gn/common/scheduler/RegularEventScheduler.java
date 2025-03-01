package com.gn.common.scheduler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.gn.plan.service.PlanService;
import com.gn.plan.vo.Plan;
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
			
			/* plan_rule 테이블에 데이터가 있는 경우 */			
			for(PlanRule pr : list) {
				
				// 구장 번호는 그대로 들어가면 됨
				int fieldNo = pr.getFieldNo();
				
				// 날짜는 14일의 간격을 가지고 입력되도록 할 것임
				LocalDateTime now = LocalDateTime.now();
				LocalDateTime nowPlusDays = now.plusDays(14);
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				String planDate = nowPlusDays.format(dtf);
				
				// 가격은 그대로 들어가면 됨
				String price = pr.getPrice();
				
				// 일정 시간은 반복문으로 인서트 절차를 구현해야함 - openTime ~ closeTime 사이의 간격을 operating으로 나누어서 해당 횟수만큼 
				String openTime = pr.getOpenTime();
				String closeTime = pr.getCloseTime();
				String operating = pr.getOperating();
				
				if(openTime != null && closeTime != null) {
					// 앞에서 NOT NULL을 보장받았기 때문에 null이 들어올 수가 없음
					int ot = Integer.parseInt(openTime);
					int ct = Integer.parseInt(closeTime);
					int op = Integer.parseInt(operating);

					if(ot <= ct) {
						// 11 ~ 23 등의 영업시간을 갖는 형태
						for(int i=0; i<(ct-ot)/op; i++) {
							String planTime = (ot+op*i) + ":00";
							
							if((ot+op*i) < 10) {
								planTime = "0" + (ot+op*i) + ":00";
							}
							
							Plan plan = Plan.builder()
									.fieldNo(fieldNo)
									.planTime(planTime)
									.planDate(planDate)
									.useTime(operating)
									.planPrice(price)
									.build();
							
							int result = new PlanService().insertPlan(plan);
							
							if(result > 0) {
//								System.out.println("RegularEventScheduler : 스케줄러에 의해 일정이 정상적으로 등록되었습니다.");								
							}
						}
						
					} else {
						// 23 ~ 11 등의 영업시간을 갖는 형태
						for(int i=0; i<(ct+24-ot)/op; i++) {
							if((ot+op*i) < 24) {
								String planTime = (ot+op*i) + ":00";								
								
								if((ot+op*i) < 10) {
									planTime = "0" + (ot+op*i) + ":00";
								}
								
								System.out.println(planTime);
								
								Plan plan = Plan.builder()
										.fieldNo(fieldNo)
										.planTime(planTime)
										.planDate(planDate)
										.useTime(operating)
										.planPrice(price)
										.build();
								
								int result = new PlanService().insertPlan(plan);
								
								if(result > 0) {
//									System.out.println("RegularEventScheduler : 스케줄러에 의해 일정이 정상적으로 등록되었습니다.");								
								}
								
							} else {
								String planTime = (ot+op*i - 24) + ":00";
								
								if((ot+op*i - 24) < 10) {
									planTime = "0" + (ot+op*i - 24) + ":00";
								}
								
								nowPlusDays = now.plusDays(15);
								planDate = nowPlusDays.format(dtf);
								
								Plan plan = Plan.builder()
										.fieldNo(fieldNo)
										.planTime(planTime)
										.planDate(planDate)
										.useTime(operating)
										.planPrice(price)
										.build();
								
								int result = new PlanService().insertPlan(plan);
								
								if(result > 0) {
//									System.out.println("RegularEventScheduler : 스케줄러에 의해 일정이 정상적으로 등록되었습니다.");								
								}
								
							}
						}
					}
					
				}

			}

		} else {
			System.out.println("RegularEventScheduler : 리스트가 null입니다.");
			/* plan_rule 테이블에 데이터가 없는 경우 - 아무도 규칙을 등록하지 않은 상태 */
			
			System.out.println("RegularEventScheduler : 스케줄러는 아무런 동작도 하지 않을 것입니다.");
		}

	}
}