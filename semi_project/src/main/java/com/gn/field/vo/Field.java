package com.gn.field.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
public class Field extends PagingField {
	private int fieldNo;
	private int userNo;
	private String fieldName;
	private String fieldAddr;
	private String fieldSize;
	private int fieldLimit;
	private String fieldType;
	private String isIndoor;
	private Boolean isPark;
	private Boolean isShower;
	private String rentPrice;
	private int dayoffNo;
	private String message;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	
	private boolean isSun;
	private boolean isMon;
	private boolean isTue;
	private boolean isWed;
	private boolean isThu;
	private boolean isFri;
	private boolean isSat;
}
