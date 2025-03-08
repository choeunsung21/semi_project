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
public class Reply {
	private int replyNo;
	private int writerNo;
	private int boardNo;
	private String replyContent;
	private LocalDateTime regDate;
	private LocalDateTime modDate;	
	private String userId;
}
