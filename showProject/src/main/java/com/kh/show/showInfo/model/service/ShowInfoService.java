package com.kh.show.showInfo.model.service;

import java.util.ArrayList;

import com.kh.show.showInfo.model.vo.Show;

public interface ShowInfoService {
	
	// 공연상세정보조회
	ArrayList<Show> selectShow();

	//뮤지컬 랭킹(1~5위) 조회
	ArrayList<Show> musicalShow();

	//뮤지컬 경기/인천 지역 조회
	ArrayList<Show> musicalRegion();

	//뮤지컬 충청/강원 지역 조회
	ArrayList<Show> musicalRegion2();

	//뮤지컬 대구/경북 지역 조회
	ArrayList<Show> musicalRegion3();

	//뮤지컬 부산/경남 지역 조회
	ArrayList<Show> musicalRegion4();

	//뮤지컬 광주/전라 지역 조회
	ArrayList<Show> musicalRegion5();
	
	//뮤지컬 제주 지역 조회
	ArrayList<Show> musicalRegion6();

	//연극 랭킹(1~5위) 조회
	ArrayList<Show> playShow();

	//연극 경기/인천 지역 조회
	ArrayList<Show> playRegion1();

	//연극 충청/강원 지역 조회
	ArrayList<Show> playRegion2();

	//연극 대구/경북 지역 조회
	ArrayList<Show> playRegion3();

	//연극 부산/경남 지역 조회
	ArrayList<Show> playRegion4();

	//연극 광주/전라 지역 조회
	ArrayList<Show> playRegion5();

	//연극 제주 지역 조회
	ArrayList<Show> playRegion6();

	//콘서트 랭킹(1~5위) 조회
	ArrayList<Show> concertShow();

	ArrayList<Show> concertRegion1();

	ArrayList<Show> concertRegion2();

	ArrayList<Show> concertRegion3();

	ArrayList<Show> concertRegion4();

	ArrayList<Show> concertRegion5();

	ArrayList<Show> concertRegion6();

	//클래식 랭킹(1~5위) 조회
	ArrayList<Show> classicShow();

	ArrayList<Show> classicRegion1();

	ArrayList<Show> classicRegion2();

	ArrayList<Show> classicRegion3();

	ArrayList<Show> classicRegion4();

	ArrayList<Show> classicRegion5();

	ArrayList<Show> classicRegion6();

	//전시 랭킹(1~5위) 조회
	ArrayList<Show> displayShow();

	ArrayList<Show> displayRegion1();

	ArrayList<Show> displayRegion2();

	ArrayList<Show> displayRegion3();

	ArrayList<Show> displayRegion4();

	ArrayList<Show> displayRegion5();

	ArrayList<Show> displayRegion6();

}
