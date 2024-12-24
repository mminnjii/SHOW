package com.kh.show.showInfo.model.service;

import java.util.ArrayList;

import com.kh.show.showInfo.model.vo.Show;

public interface ShowInfoService {
	
	// 공연상세정보조회
	ArrayList<Show> selectShow();

	//뮤지컬 랭킹(1~5위) 조회
	ArrayList<Show> musicalShow();

}
