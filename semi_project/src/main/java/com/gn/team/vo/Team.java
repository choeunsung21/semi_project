package com.gn.team.vo;

import java.time.LocalDateTime;

import com.gn.team.page.Paging;

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
public class Team extends Paging{
    private int teamNo; // 팀 번호
    private String teamName; // 팀 이름
    private int leaderNo; // 팀장 회원 번호
    private String teamArea; // 활동 지역
    private String preferGender; // 성별 (남, 여, 무관)
    private int teamLevel; // 팀 실력
    private int teamCount; // 현재 팀원 수
    private int teamLimit; // 팀 정원
    private String teamExplanation; // 팀 설명
    private LocalDateTime regDate; // 팀 생성일
    private LocalDateTime modDate; // 팀 수정일
// 추가된 코드
    private int nowPage = 1; // 현재 페이지 (기본값 1)
    private int numPerPage = 10; // 한 페이지당 게시글 수
    private int totalData; // 전체 데이터 개수
    private int totalPage; // 전체 페이지 개수
    private int limitPageNo; // LIMIT 시작 값
}



