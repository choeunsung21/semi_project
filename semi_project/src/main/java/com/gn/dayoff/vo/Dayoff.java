package com.gn.dayoff.vo;

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
public class Dayoff {
	private int dayoffNo;
	private boolean isSun;
	private boolean isMon;
	private boolean isTue;
	private boolean isWed;
	private boolean isThu;
	private boolean isFri;
	private boolean isSat;
}
