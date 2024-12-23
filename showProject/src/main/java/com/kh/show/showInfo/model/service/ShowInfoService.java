package com.kh.show.showInfo.model.service;

import java.util.ArrayList;

import com.kh.show.showInfo.model.vo.Show;

public interface ShowInfoService {

	//뮤지컬 랭킹(1~5위) 조회
	ArrayList<Show> musicalShow();

}
