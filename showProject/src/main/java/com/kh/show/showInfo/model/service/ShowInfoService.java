package com.kh.show.showInfo.model.service;

import java.util.ArrayList;

import com.kh.show.showInfo.model.vo.Review;
import com.kh.show.showInfo.model.vo.Show;
import com.kh.show.showInfo.model.vo.ShowRound;

public interface ShowInfoService {
	
	// 공연상세정보조회
	Show selectShow();
	
	// 공연회차정보조회
	ArrayList<ShowRound> selectRound();
	
	// 리뷰조회
	ArrayList<Review> selectReview();
	
	// 리뷰 갯수 조회
	int selectRcount();
	
	// 리뷰 검색
	ArrayList<Review> reviewSearch(String keyword);
	
	// 리뷰 검색 갯수 조회
	int searchRcount(String keyword);

	
	
	

}
