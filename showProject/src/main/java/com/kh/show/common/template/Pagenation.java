package com.kh.show.common.template;


import com.kh.show.common.template.PageInfo;


public class Pagenation {
	
	// 페이징 처리 메소드 
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		// 가장 마지막 페이지  (총 게시글 개수/한 페이지에 보여질 개수)
		int maxPage = (int)Math.ceil((double)listCount/boardLimit); 
		
		// 페이징바 시작 번호 
		int startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		
		/*
		 * 페이지 1~10 : 1
		 * 		11~20 : 11
		 * 		21~30 : 21
		 * 
		 * 0~9 / 10      0 + *10  == 0+1 = 1
		 * 10~19 / 10 == 1 + *10  == 10+1 == 11
		 * 21~30 / 10 == 2 + *10  == 20+1 == 21
		 * 
		 * 현재 페이지(currentPage)와 페이지 하단에 보여지는 페이징바 최대 개수(pageLimit)를 기준으로 계산 
		 * (currentPage - 1)/pageLimit * pageLimit + 1 ; 
		 * 
		 * */
		
		// 페이징바 끝 수
		int endPage = startPage+pageLimit-1;
		/* 페이징 시작 수에 따라 끝 수를 정한다. => 무의미한 페이지가 생성된다. 
		 * 최대 페이지 수가 끝 페이지 수 보다 작으면 끝 페이지 수를 최대 페이지(데이터에 따른 가장 마지막 페이지) 수로 변경한다. 
		 * */
		
		// 무의미한 페이지가 나오지 않는 조건 처리
		// 가장 마지막 페이지보다 페이징바 끝 수가 크면 가장 마지막 페이지의 값을 페이징바 끝 수 변수에 넣는다. 
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		return pi;
		
	}
	
}
