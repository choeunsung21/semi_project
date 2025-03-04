package com.gn.rule.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class PlanRule extends PagingRule {
	private int ruleNo;
	private int fieldNo;
	private String openTime;
	private String closeTime;
	private String operating;
	private String price;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	
	private boolean isSun;
	private boolean isMon;
	private boolean isTue;
	private boolean isWed;
	private boolean isThu;
	private boolean isFri;
	private boolean isSat;
	
	private String FieldName;
	
	private int userNo;
}
