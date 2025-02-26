package com.gn.team.vo;

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
public class Team {
	private int teamNo;
	private String teamName;
	private int leaderNo;
	private String teamArea;
	private String userGender;
	private String teamLevel;
	private int teamCount;
	private int teamLimit;
	private String teamExplanation;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	private int playerNo;
	private int userNo;
}
// 추가 사항 -> userGender / teamLevel 추가

