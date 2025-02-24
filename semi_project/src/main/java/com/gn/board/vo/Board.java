package com.gn.board.vo;

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
public class Board {
	private int boardNo;
	private int writerNo;
	public String boardTitle;
	public String boardContent;
	public LocalDateTime regDate;
	public LocalDateTime modDate;
	private String memberName;

}
