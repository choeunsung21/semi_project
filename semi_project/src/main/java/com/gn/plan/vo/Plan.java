package com.gn.plan.vo;

import java.time.LocalDateTime;

import com.gn.field.vo.Field;

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
public class Plan extends PagingPlan {
	private int planNo;
	private String planDate;
	private String planTime;
	private String planPrice;
	private String useTime;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	private String fieldName;
	private int userNo;
	private int fieldNo;
	private Field field;
	
}
