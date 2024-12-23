package com.kh.show.common.template;

import com.kh.show.common.model.vo.PageInfo;

public class Pagenation {
	
	// 페이징 처리 메소드 
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		// 가장 마지막 페이지  (총 게시글 개수/한 페이지에 보여질 개수)
		int maxPage = (int)Math.ceil((double)listCount/boardLimit); 
		
		// 페이징바 시작 번호 
		int startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		// 페이징바 끝 수
		int endPage = startPage+pageLimit-1;
		
		// 무의미한 페이지가 나오지 않는 조건 처리
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		return pi;
		
	}
	
}
