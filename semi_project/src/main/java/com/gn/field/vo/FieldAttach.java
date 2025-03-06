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
public class FieldAttach {
	private int attachNo;
	private String oriName;
	private String newName;
	private int fieldNo;
	private String filePath;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
}
