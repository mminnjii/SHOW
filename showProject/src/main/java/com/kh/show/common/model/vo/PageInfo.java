package com.kh.show.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PageInfo {
	
	private int listCount;  	// 총 게시글 개수 
	private int currentPage;	// 현재 페이지 
	private int pageLimit; 		// 페이지 하단에 보여질 페이징바 최대 개수 
	private int boardLimit;		// 한 페이지에 보여질 게시글 개수 
	
	private int maxPage;		// 가장 마지막 페이지 (총 페이지 개수)
	private int startPage;		// 페이지 하단에 보여질 페이징바 시작 수
	private int endPage; 		// 페이지 하단에 보여질 페이징바 끝 수
	
}
