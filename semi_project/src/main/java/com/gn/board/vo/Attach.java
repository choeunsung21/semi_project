package com.gn.board.vo;

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
public class Attach {
	private int attachNo;
	private String oriName;
	private String newName;
	private int boardNo;
	private String attachPath;
}
