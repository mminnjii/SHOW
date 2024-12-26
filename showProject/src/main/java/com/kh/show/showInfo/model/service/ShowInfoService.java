package com.kh.show.showInfo.model.service;

import java.util.ArrayList;

import com.kh.show.showInfo.model.vo.Review;
import com.kh.show.showInfo.model.vo.Show;
import com.kh.show.showInfo.model.vo.ShowRound;

public interface ShowInfoService {
	
	// 공연상세정보조회
	Show selectShow();
	
	// 공연회차정보조회(날짜)
	ArrayList<ShowRound> selectRound();
	
	// 공연회차정보조회(시간 /회차)
	ArrayList<ShowRound> selectTime(String date);
	
	// 회차정보 상태값 업데이트 (현재날짜 기준 / 공연장 좌석수 기준)
	int updateSysdate();
	int updateShowRound();
	
	// 리뷰조회
	ArrayList<Review> selectReview();
	
	// 리뷰 갯수 조회
	int selectRcount();
	
	// 리뷰 검색
	ArrayList<Review> reviewSearch(String keyword);
	
	// 리뷰 검색 갯수 조회
	int searchRcount(String keyword);

	

	
	

	
	

	
	
	

}
