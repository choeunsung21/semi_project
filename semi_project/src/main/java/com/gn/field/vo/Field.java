package com.gn.field.vo;

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
public class Field {
	private int fieldNo;
	private int userNo;
	private String fieldName;
	private String fieldAddr;
	private String fieldSize;
	private int fieldLimit;
	private String fieldType;
	private String isIndoor;
	private boolean isPark;
	private boolean isShower;
	private String rentPrice;
	private int dayoffNo;
	private int[] dayoffList;
	private String message;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
}
