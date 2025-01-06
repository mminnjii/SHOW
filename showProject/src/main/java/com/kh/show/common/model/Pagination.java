package com.kh.show.common.model;

import java.util.ArrayList;
import java.util.List;

import com.kh.show.common.template.PageInfo;

public class Pagination {
	public static List<Integer> getPageList(PageInfo pageInfo){
		List<Integer> pageList = new ArrayList<>();

		int currentPage = pageInfo.getCurrentPage();
		int totalPage = pageInfo.getEndPage(); // *** 원래 gettotalpage 로작성되어있었다
		int startPage = (currentPage / 5) * 5 + 1;
		// 5페이지씩 보여주고 싶으면 (currentPage / 5) * 5 + 1
		// 10페이지씩 보여주고 싶으면 (currentPage / 10) * 10 + 1
		// 현재 페이지가 3이라고 가정했을 때, 3 / 5 = 0.6(소숫점은 버림) * 5 + 1 = 1
		// 현재 페이지가 7이라고 가정했을 때, 7 / 5 = 1.4(소숫점은 버림) * 5 + 1 = 6
	
		int endPage = startPage + 4;
		// 보여주고싶은 페이지 갯수 - 1만큼 빼서 startPage에 더해주기 (5개씩 보여주고 싶다면 startPage가 1일테니 1+4, 5개까지만)
		// 10개씩 보여주고싶다면 startPage + 9
	
		if(endPage > totalPage){
			endPage = totalPage;
		}
		// 끝페이지가 전체페이지보다 큰 순간부터는, endPage를 totalPage로 설정하기.
		// 5페이지씩 보여주고 싶은데 13까지가 끝일때는 15페이지가 아닌 13페이지가 끝이 되도록 설정
	
		for (int i=startPage; i<=endPage; i++){
			pageList.add(i);
		}
	
		if(startPage > 1){
			pageList.add(0, -1);
		}
	
		if (endPage < totalPage){
			pageList.add(endPage + 1);
		}
		return pageList;

	}
}