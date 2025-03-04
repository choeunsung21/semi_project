package com.gn.board.vo;

import java.time.LocalDateTime;

import com.gn.board.page.Paging;

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

//board클래스에서 memberName에서 -> userName으로 수정
public class Board extends Paging  {
	private int boardNo;
	private int writerNo;
	private String boardTitle;
	private String boardContent;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	private String userName;
	private String userId;
	private int attachNo;
	private String attachPath;
	private String oriName;
}
