package com.gn.user.vo;

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
public class UserBoard{
    private int boardNo;        // 글 번호
    private String boardTitle;  // 글 제목
    private LocalDateTime regDate;  // 작성일 (필요 시 추가)
    private String userId;      // 작성자 ID (User와 연결)
}