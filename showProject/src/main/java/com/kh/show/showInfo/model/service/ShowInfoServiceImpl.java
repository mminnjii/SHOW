package com.kh.show.showInfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.showInfo.model.dao.ShowInfoDao;
import com.kh.show.showInfo.model.vo.Review;
import com.kh.show.showInfo.model.vo.Show;
import com.kh.show.showInfo.model.vo.ShowRound;

@Service
public class ShowInfoServiceImpl implements ShowInfoService {

	@Autowired
	private ShowInfoDao showInfoDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Show> musicalShow() {
		
		ArrayList<Show> musicalShowList = showInfoDao.musicalShow(sqlSession);
		
		
		return musicalShowList;
	}

	
	@Override
	public Show selectShow(String showName) {
		Show s = showInfoDao.selectShow(sqlSession,showName);
		return s;
	}

	@Override
	public ArrayList<ShowRound> selectRound() {
		ArrayList<ShowRound> round  = showInfoDao.selectRound(sqlSession);
		return round;
	}
	
	
	@Override
	public int updateSysdate() {
		return showInfoDao.updateSysdate(sqlSession);
	}
	
	@Override
	public int updateShowRound(int roundId) {
		return showInfoDao.updateShowRound(sqlSession,roundId);
	}
	
	@Override
	public ArrayList<ShowRound> selectTime(String date) {
		return showInfoDao.selectTime(sqlSession,date);
	}
	
	
	@Override
	public ArrayList<Review> selectReview(int showNo) {
		ArrayList<Review> list = showInfoDao.selectReview(sqlSession,showNo);
		return list;
	}


	@Override
	public int selectRcount(int showNo) {
		return showInfoDao.selectRcount(sqlSession,showNo);
	}


	@Override
	public ArrayList<Review> reviewSearch(String keyword) {
		ArrayList<Review> list = showInfoDao.reviewSearch(sqlSession,keyword);
		return list;
	}


	@Override
	public int searchRcount(String keyword) {
		return showInfoDao.searchRcount(sqlSession,keyword);
	}

	@Override
	public ArrayList<Show> musicalRegion() {
		
		ArrayList<Show> musicalRegionList = showInfoDao.musicalRegionList(sqlSession);
		
		//System.out.println(musicalRegionList);
		
		
		return musicalRegionList;
	}


	@Override
	public ArrayList<Show> musicalRegion2() {

		ArrayList<Show> musicalRegionList2 = showInfoDao.musicalRegionList2(sqlSession);
		
		return musicalRegionList2;
	}


	@Override
	public ArrayList<Show> musicalRegion3() {
		
		ArrayList<Show> musicalRegionList3 = showInfoDao.musicalRegionList3(sqlSession);
		
		return musicalRegionList3;
	}


	@Override
	public ArrayList<Show> musicalRegion4() {


		ArrayList<Show> musicalRegionList4 = showInfoDao.musicalRegionList4(sqlSession);
		
		return musicalRegionList4;
	}


	@Override
	public ArrayList<Show> musicalRegion5() {

		ArrayList<Show> musicalRegionList5 = showInfoDao.musicalRegionList5(sqlSession);
		
		return musicalRegionList5;
	}


	@Override
	public ArrayList<Show> musicalRegion6() {
		
		ArrayList<Show> musicalRegionList6 = showInfoDao.musicalRegionList6(sqlSession);
		
		return musicalRegionList6;
	}


	@Override
	public ArrayList<Show> playShow() {
		
		ArrayList<Show> playShowList = showInfoDao.playShowList(sqlSession);
		
		return playShowList;
	}


	@Override
	public ArrayList<Show> playRegion1() {
		
		ArrayList<Show> playRegionList1 = showInfoDao.playRegionList1(sqlSession);
		
		return playRegionList1;
	}


	@Override
	public ArrayList<Show> playRegion2() {

		ArrayList<Show> playRegionList2 = showInfoDao.playRegionList2(sqlSession);
		
		return playRegionList2;
	}


	@Override
	public ArrayList<Show> playRegion3() {

		ArrayList<Show> playRegionList3 = showInfoDao.playRegionList3(sqlSession);
		
		return playRegionList3;
	}


	@Override
	public ArrayList<Show> playRegion4() {

		ArrayList<Show> playRegionList4 = showInfoDao.playRegionList4(sqlSession);
		
		return playRegionList4;
	}


	@Override
	public ArrayList<Show> playRegion5() {

		ArrayList<Show> playRegionList5 = showInfoDao.playRegionList5(sqlSession);
		
		return playRegionList5;
	}


	@Override
	public ArrayList<Show> playRegion6() {

		ArrayList<Show> playRegionList6 = showInfoDao.playRegionList6(sqlSession);
		
		return playRegionList6;
	}


	@Override
	public ArrayList<Show> concertShow() {

		ArrayList<Show> concertShowList = showInfoDao.concertShowList(sqlSession);
		
		return concertShowList;
	}


	@Override
	public ArrayList<Show> concertRegion1() {

		ArrayList<Show> concertRegionList1 = showInfoDao.concertRegionList1(sqlSession);
		
		return concertRegionList1;
	}


	@Override
	public ArrayList<Show> concertRegion2() {

		ArrayList<Show> concertRegionList2 = showInfoDao.concertRegionList2(sqlSession);
		
		return concertRegionList2;
	}


	@Override
	public ArrayList<Show> concertRegion3() {


		ArrayList<Show> concertRegionList3 = showInfoDao.concertRegionList3(sqlSession);
		
		return concertRegionList3;
	}


	@Override
	public ArrayList<Show> concertRegion4() {

		ArrayList<Show> concertRegionList4 = showInfoDao.concertRegionList4(sqlSession);
		
		return concertRegionList4;
	}


	@Override
	public ArrayList<Show> concertRegion5() {

		ArrayList<Show> concertRegionList5 = showInfoDao.concertRegionList5(sqlSession);
		
		return concertRegionList5;
	}


	@Override
	public ArrayList<Show> concertRegion6() {


		ArrayList<Show> concertRegionList6 = showInfoDao.concertRegionList6(sqlSession);
		
		return concertRegionList6;
	}


	@Override
	public ArrayList<Show> classicShow() {

		ArrayList<Show> classicShowList = showInfoDao.classicShowList(sqlSession);
		
		return classicShowList;
	}


	@Override
	public ArrayList<Show> classicRegion1() {

		ArrayList<Show> classicRegion1 = showInfoDao.classicRegion1(sqlSession);
		
		return classicRegion1;
	}


	@Override
	public ArrayList<Show> classicRegion2() {

		ArrayList<Show> classicRegion2 = showInfoDao.classicRegion2(sqlSession);
		
		return classicRegion2;
	}


	@Override
	public ArrayList<Show> classicRegion3() {
		
		ArrayList<Show> classicRegion3 = showInfoDao.classicRegion3(sqlSession);
		
		return classicRegion3;
	}


	@Override
	public ArrayList<Show> classicRegion4() {

		ArrayList<Show> classicRegion4 = showInfoDao.classicRegion4(sqlSession);
		
		return classicRegion4;
	}


	@Override
	public ArrayList<Show> classicRegion5() {

		ArrayList<Show> classicRegion5 = showInfoDao.classicRegion5(sqlSession);
		
		return classicRegion5;
	}


	@Override
	public ArrayList<Show> classicRegion6() {

		ArrayList<Show> classicRegion6 = showInfoDao.classicRegion6(sqlSession);
		
		return classicRegion6;
	}


	@Override
	public ArrayList<Show> displayShow() {

		ArrayList<Show> displayShow = showInfoDao.displayShow(sqlSession);
		
		return displayShow;
	}


	@Override
	public ArrayList<Show> displayRegion1() {

		ArrayList<Show> displayRegion1 = showInfoDao.displayRegion1(sqlSession);
		
		return displayRegion1;
	}


	@Override
	public ArrayList<Show> displayRegion2() {

		ArrayList<Show> displayRegion2 = showInfoDao.displayRegion2(sqlSession);
		
		return displayRegion2;

	}


	@Override
	public ArrayList<Show> displayRegion3() {

		ArrayList<Show> displayRegion3 = showInfoDao.displayRegion3(sqlSession);
		
		return displayRegion3;
	}


	@Override
	public ArrayList<Show> displayRegion4() {

		ArrayList<Show> displayRegion4 = showInfoDao.displayRegion4(sqlSession);
		
		return displayRegion4;
	}


	@Override
	public ArrayList<Show> displayRegion5() {

		ArrayList<Show> displayRegion5 = showInfoDao.displayRegion5(sqlSession);
		
		return displayRegion5;
	}


	@Override
	public ArrayList<Show> displayRegion6() {

		ArrayList<Show> displayRegion6 = showInfoDao.displayRegion6(sqlSession);
		
		return displayRegion6;
	}



	//검색 목록
	@Override
	public ArrayList<Show> searchBox(HashMap<String, String> hashMap) {
		
		return showInfoDao.searchBox(sqlSession,hashMap);
	}

	//검색 목록 개수
	@Override
	public int searchListCount(HashMap<String, String> hashMap) {

		return showInfoDao.searchListCount(sqlSession,hashMap);
	}



	//뮤지컬 서울 지역 
	@Override
	public ArrayList<Show> musicalRegion0() {

		return showInfoDao.musicalRegion0(sqlSession);
	}


	@Override
	public ArrayList<Show> playRegion0() {

		return showInfoDao.playRegion0(sqlSession);
	}


	@Override
	public ArrayList<Show> concertRegion0() {

		return showInfoDao.concertRegion0(sqlSession);
	}


	@Override
	public ArrayList<Show> classicRegion0() {

		return showInfoDao.classicRegion0(sqlSession);
	}


	@Override
	public ArrayList<Show> displayRegion0() {

		return showInfoDao.displayRegion0(sqlSession);
	}


	@Override
	public ArrayList<Show> mainRegionRank() {

		return showInfoDao.mainRegionRank(sqlSession);
	}


	@Override
	public int increaseCount(String showName) {
		
		return showInfoDao.increaseCount(sqlSession,showName);
	}


	@Override
	public Show selectShowInfo(int sno) {

		return showInfoDao.selectShowInfo(sqlSession,sno);
	}


	@Override
	public ArrayList<Show> rankShowList() {

		return showInfoDao.rankShowList(sqlSession);
	}


	public int enrollReview(Review r) {
		return showInfoDao.enrollReview(sqlSession,r);
	}


	@Override
	public Review searchReview(int replyNo) {
		return showInfoDao.searchReview(sqlSession,replyNo);
	}


	@Override
	public int updateReview(Review r) {
		return showInfoDao.updateReview(sqlSession,r);
	}


	@Override
	public int deleteReview(int replyNo) {
		return showInfoDao.deleteReview(sqlSession,replyNo);
	}



	@Override
	public Show selectWithName(String name) {
		return showInfoDao.selectWithName(sqlSession,name);
	}



	@Override
	public Show openSelect(String showName) {

		return showInfoDao.openSelect(sqlSession,showName);
	}



	@Override
	public ArrayList<Show> openTicketList() {

		return showInfoDao.openTicketList(sqlSession);
	}


	@Override
	public ArrayList<Show> mainRegionRank0() {
		
		return showInfoDao.mainRegionRank0(sqlSession);
	}


	@Override
	public ArrayList<Show> mainRegionRank1() {

		return showInfoDao.mainRegionRank1(sqlSession);
	}


	@Override
	public ArrayList<Show> mainRegionRank2() {

		return showInfoDao.mainRegionRank2(sqlSession);
	}


	@Override
	public ArrayList<Show> mainRegionRank3() {

		return showInfoDao.mainRegionRank3(sqlSession);
	}


	@Override
	public ArrayList<Show> mainRegionRank4() {

		return showInfoDao.mainRegionRank4(sqlSession);
	}


	@Override
	public ArrayList<Show> mainRegionRank5() {

		return showInfoDao.mainRegionRank5(sqlSession);
	}


	@Override
	public ArrayList<Show> mainRegionRank6() {

		return showInfoDao.mainRegionRank6(sqlSession);
	}




}
