package com.gn.reservation.vo;

import java.time.LocalDateTime;

import com.gn.field.vo.Field;
import com.gn.plan.vo.Plan;

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
public class Reservation {
	private int reservationNo;
	private int userNo;
	private int planNo;
	private LocalDateTime regDate;
	private Field field;
	private Plan plan;
}
