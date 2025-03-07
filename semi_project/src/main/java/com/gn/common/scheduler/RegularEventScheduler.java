package com.gn.common.scheduler;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
		// 2. 유저의 등록규칙을 SELECT 할 때 dayoff 테이블과 조인을 해야함
		
		System.out.println("RegularEventScheduler : 스케줄러가 정상적으로 호출되었습니다."+" ("+new Timestamp(System.currentTimeMillis())+")");
		
		List<PlanRule> list = new PlanRuleService().selectPlanRuleAll();
		
		if(list != null && list.size() != 0) {
			
			/* plan_rule 테이블에 데이터가 있는 경우 */
			for(PlanRule pr : list) {
				
				if(pr.getStatus() == 0) {
					// 스케줄러가 해당 규칙에 따라 처음 입력하는 상황
					
					// 구장 번호는 그대로 들어가면 됨
					int fieldNo = pr.getFieldNo();
					
					// 날짜는 1일 후부터 14일 후까지 입력되도록 할 것임
					LocalDateTime now = LocalDateTime.now();
					
					for(int j=1; j<=14; j++) {
						LocalDateTime nowPlusDays = now.plusDays(j);
						
						// 14일 후의 요일에 따라서 동작을 나눠줘야함
						int day = nowPlusDays.getDayOfWeek().getValue(); // 월요일 = 1 ~ 일요일 = 7
						
						switch(day) {
						case 1:
							if(pr.isMon()==true) {
								continue;
							}
							break;
						case 2:
							if(pr.isTue()==true) {
								continue;
							}
							break;
						case 3:
							if(pr.isWed()==true) {
								continue;
							}
							break;
						case 4:
							if(pr.isThu()==true) {
								continue;
							}
							break;
						case 5:
							if(pr.isFri()==true) {
								continue;
							}
							break;
						case 6:
							if(pr.isSat()==true) {
								continue;
							}
							break;
						case 7:
							if(pr.isSun()==true) {
								continue;
							}
							break;
						}
						
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
//										System.out.println("RegularEventScheduler : 스케줄러에 의해 일정이 정상적으로 등록되었습니다.");								
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
										
//										System.out.println(planTime);
										
										Plan plan = Plan.builder()
												.fieldNo(fieldNo)
												.planTime(planTime)
												.planDate(planDate)
												.useTime(operating)
												.planPrice(price)
												.build();
										
										int result = new PlanService().insertPlan(plan);
										
										if(result > 0) {
//											System.out.println("RegularEventScheduler : 스케줄러에 의해 일정이 정상적으로 등록되었습니다.");								
										}
									}
								}
							}
						}
					}
					
					// 한 번 적용했으므로 다음부터는 else로 들어가도록 status를 1로 바꾸어줌
					new PlanRuleService().updateStatus(pr.getRuleNo());
					
				} else {
					// 스케줄러가 해당 규칙에 따라 두 번 이상 입력하는 상황
					
					// 구장 번호는 그대로 들어가면 됨
					int fieldNo = pr.getFieldNo();
					
					// 날짜는 14일의 간격을 가지고 입력되도록 할 것임
					LocalDateTime now = LocalDateTime.now();
					LocalDateTime nowPlusDays = now.plusDays(14);
					
					// 14일 후의 요일에 따라서 동작을 나눠줘야함
					int day = nowPlusDays.getDayOfWeek().getValue(); // 월요일 = 1 ~ 일요일 = 7
					
					switch(day) {
					case 1:
						if(pr.isMon()==true) {
							continue;
						}
						break;
					case 2:
						if(pr.isTue()==true) {
							continue;
						}
						break;
					case 3:
						if(pr.isWed()==true) {
							continue;
						}
						break;
					case 4:
						if(pr.isThu()==true) {
							continue;
						}
						break;
					case 5:
						if(pr.isFri()==true) {
							continue;
						}
						break;
					case 6:
						if(pr.isSat()==true) {
							continue;
						}
						break;
					case 7:
						if(pr.isSun()==true) {
							continue;
						}
						break;
					}
					
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
//									System.out.println("RegularEventScheduler : 스케줄러에 의해 일정이 정상적으로 등록되었습니다.");								
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
									
//									System.out.println(planTime);
									
									Plan plan = Plan.builder()
											.fieldNo(fieldNo)
											.planTime(planTime)
											.planDate(planDate)
											.useTime(operating)
											.planPrice(price)
											.build();
									
									int result = new PlanService().insertPlan(plan);
									
									if(result > 0) {
//										System.out.println("RegularEventScheduler : 스케줄러에 의해 일정이 정상적으로 등록되었습니다.");								
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
//										System.out.println("RegularEventScheduler : 스케줄러에 의해 일정이 정상적으로 등록되었습니다.");								
									}
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
		
		System.out.println("RegularEventScheduler : 스케줄러가 정상적으로 동작완료되었습니다."+" ("+new Timestamp(System.currentTimeMillis())+")");
		
		
		// 지난 일정 삭제
		LocalDateTime nowTime = LocalDateTime.now();
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String today = nowTime.format(dtf);
		
		int deletedCount = new PlanService().deleteOldPlans(today);
		System.out.println("RegularEventScheduler : 지난 일정 " + deletedCount + "건 삭제 완료.");
		
	}
}

