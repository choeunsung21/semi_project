package com.gn.apply.vo;

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
public class Apply {
	private int applyNo; // 신청 번호
	private int userNo; // 회원 번호
	private int teamNo; // 팀 번호
	private String position; // 선호 포지션
	private String applyArea; // 선호 지역
	private String applyExplanation; // 소개글
	private String status; // 대기,승낙,거절 상태
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	
	private String teamName; // 팀 이름
	private int leaderNo; // 팀장 번호
	private String teamArea; // 선호 지역(팀)
	private int teamLevel; // 팀 실력
	
	private String userId; // 유저 아이디
	private String userName; // 유저 이름
}
