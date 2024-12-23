package com.kh.show.common.model.vo;

import lombok.Data;

@Data
public class PageInfo {
	private int totalCount;		// 전체 데이터 수
	private int pageSize;		// 한 페이지당 표시할 데이터 수
	private int currentPage;	// 현재 사용자가 보고있는 페이지
	private int totalPage;		// 전체 페이지 수
	
	public PageInfo(int totalCount, int pageSize, int currentPage){
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalPage = (int)Math.ceil((double)totalCount/pageSize);
	}
}
