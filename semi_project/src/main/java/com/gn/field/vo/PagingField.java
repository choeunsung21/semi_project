package com.gn.field.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingField {
	// 전체 게시글 개수
	private int totalData;
	
	// 전체 페이지 개수
	private int totalPage;
	
	// 페이징바
	private int pageBarSize = 5;
	private int pageBarStart;
	private int pageBarEnd;
	
	//현재 페이지
	private int nowPage = 1;
	
	// 한 페이지당 게시글의 개수
	private int numPerPage = 5;
	
	// LIMIT 시작 번호
	private int limitPageNo;
		
	//이전, 다음 여부
	private boolean prev = true;
	private boolean next = true;
	
	public void setTotalData(int totalData) {
		this.totalData = totalData;
		calcPaging();
	}
	
	private void calcPaging() {
		// 현재 페이지를 기준으로 건너뛸 데이터의 개수
		limitPageNo = (nowPage-1)*numPerPage;
		
		// 전체 게시글 개수를 기준으로 페이지 개수 계산
		totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		// 페이징바의 시작 번호 계산
		pageBarStart = ((nowPage-1)/pageBarSize)*pageBarSize +1;
		
		// 페이징바의 끝 번호 계산
		// 만일 끝번호가 전체 페이지 개수보다 크면 재할당
		pageBarEnd = pageBarStart + pageBarSize -1;
		if(pageBarEnd > totalPage) pageBarEnd = totalPage;
		
		// 이전, 이후 버튼이 보이는지 여부 계산
		if(pageBarStart == 1) prev = false;
		if(pageBarEnd >= totalPage) next = false;
	}
}
