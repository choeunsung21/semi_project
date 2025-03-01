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
@EqualsAndHashCode
@Builder
public class PlanRule {
	private int ruleNo;
	private int fieldNo;
	private String openTime;
	private String closeTime;
	private String operating;
	private String price;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
}
