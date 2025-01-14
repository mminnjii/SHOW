package com.kh.show.showInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.show.showInfo.model.vo.Review;
import com.kh.show.showInfo.model.vo.Show;
import com.kh.show.showInfo.model.vo.ShowRound;

public interface ShowInfoService {
	
	// 공연상세정보조회
	Show selectShow(String showName);
	
	// 공연회차정보조회(날짜)
	ArrayList<ShowRound> selectRound();
	
	// 공연회차정보조회(시간 /회차)
	ArrayList<ShowRound> selectTime(String date);
	
	// 회차정보 상태값 업데이트 (현재날짜 기준 / 공연장 좌석수 기준)
	int updateSysdate();
	int updateShowRound(int roundId);
	
	// 리뷰조회
	ArrayList<Review> selectReview(int showNo);
	
	// 리뷰 갯수 조회
	int selectRcount(int showNo);
	
	// 리뷰 검색
	ArrayList<Review> reviewSearch(String keyword);
	
	// 리뷰 검색 갯수 조회
	int searchRcount(String keyword);

	

	
	

	
	

	
	
	

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

	//검색 목록
	ArrayList<Show> searchBox(HashMap<String, String> hashMap);
	
	//검색 목록 개수 
	int searchListCount(HashMap<String, String> hashMap);

	//뮤지컬 서울지역 
	ArrayList<Show> musicalRegion0();

	//연극 서울지역
	ArrayList<Show> playRegion0();

	//콘서트 서울지역
	ArrayList<Show> concertRegion0();

	//클래식 서울지역
	ArrayList<Show> classicRegion0();

	//전시 서울지역
	ArrayList<Show> displayRegion0();

	//메인 지역별 랭킹 지역이름 가져오기
	ArrayList<Show> mainRegionRank();
	
	//조회수 증가 메소드
	int increaseCount(String showName);
	
	//공연정보 몇개만 조회
	Show selectShowInfo(int sno);
	
	//메인페이지 실시간 공연 순위 리스트
	ArrayList<Show> rankShowList();

	// 리뷰 등록하기
	int enrollReview(Review r);
	
	// 리뷰수정전 정보 조회
	Review searchReview(int replyNo);
	
	// 리뷰 수정하기
	int updateReview(Review r);
	
	// 리뷰 삭제하기
	int deleteReview(int replyNo);
	
	// 쇼이름으로 정보 검색하기
	Show selectWithName(String name);

	//메인페이지 티켓 오픈 상세 페이지 
	Show openSelect(String showName);

	//메인페이지 티켓 오픈 리스트
	ArrayList<Show> openTicketList();

	//메인페이지 지역별랭킹
	ArrayList<Show> mainRegionRank0();

	//메인페이지 지역별 랭킹 > 경기/인천
	ArrayList<Show> mainRegionRank1();

	//메인페이지 지역별 랭킹 > 충청/강원
	ArrayList<Show> mainRegionRank2();

	//메인페이지 지역별 랭킹 > 대구/경북
	ArrayList<Show> mainRegionRank3();
	
	//메인페이지 지역별 랭킹 > 부산/경남
	ArrayList<Show> mainRegionRank4();

	//메인페이지 지역별 랭킹 > 광주/전라
	ArrayList<Show> mainRegionRank5();

	//메인페이지 지역별 랭킹 > 제주
	ArrayList<Show> mainRegionRank6();
	
	

}
