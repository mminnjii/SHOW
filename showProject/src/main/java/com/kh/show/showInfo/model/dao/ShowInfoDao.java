package com.kh.show.showInfo.model.dao;

import java.util.ArrayList;
import javax.websocket.Session;
import java.util.ArrayList;
import java.util.HashMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.show.showInfo.model.vo.Review;
import com.kh.show.showInfo.model.vo.Show;
import com.kh.show.showInfo.model.vo.ShowRound;

@Repository
public class ShowInfoDao {

	//뮤지컬 랭킹(1~5위) 조회
	public ArrayList<Show> musicalShow(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.musicalShowList");
	}


	
	
	// 공연상세정보조회
	public Show selectShow(SqlSession session) {
		Show s = session.selectOne("showInfoMapper.selectShow");
		return s;
	}

	// 공연회차조회(날짜)
	public ArrayList<ShowRound> selectRound(SqlSession session) {
		return (ArrayList)session.selectList("showInfoMapper.selectRound");
	}
	
	
	public int updateSysdate(SqlSession session) {
		return session.update("showInfoMapper.updateSysdate");
	}
	
	public int updateShowRound(SqlSession session) {
		return session.update("showInfoMapper.updateShowRound");
	}
	

	
	// 공연회차조회 > 날짜선택 후(시간/회차)
	public ArrayList<ShowRound> selectTime(SqlSession session,String date) {
		ArrayList<ShowRound> list= (ArrayList)session.selectList("showInfoMapper.selectTime",date);
		return list;
	}



	//뮤지컬 경기/인천 조회
	public ArrayList<Show> musicalRegionList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.InchMusical");
	}



	//뮤지컬 충청/강원 조회
	public ArrayList<Show> musicalRegionList2(SqlSessionTemplate sqlSession) {
		
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.chMusical");
	}



	//뮤지컬 대구/경북 조회
	public ArrayList<Show> musicalRegionList3(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.deguMusical");
	}



	//뮤지컬 부산/경남 조회
	public ArrayList<Show> musicalRegionList4(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.busanMusical");
	}



	//뮤지컬 광주/전라 조회
	public ArrayList<Show> musicalRegionList5(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.kwMusical");
	}



	//뮤지컬 제주 조회
	public ArrayList<Show> musicalRegionList6(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.jejMusical");
	}



	//연극 랭킹(1~5위) 조회
	public ArrayList<Show> playShowList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.playShowList");
	}




	public ArrayList<Show> playRegionList1(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.InchPlay");
	}




	public ArrayList<Show> playRegionList2(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.chPlay");
	}




	public ArrayList<Show> playRegionList3(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.deguMusical");
	}




	public ArrayList<Show> playRegionList4(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.busanPlay");
	}




	public ArrayList<Show> playRegionList5(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.kwPlay");
	}




	public ArrayList<Show> playRegionList6(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.jejPlay");
	}




	public ArrayList<Show> concertShowList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.concertShowList");
	}




	public ArrayList<Show> concertRegionList1(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.concertRegionList1");
	}




	public ArrayList<Show> concertRegionList2(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.concertRegionList2");
	}




	public ArrayList<Show> concertRegionList3(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.concertRegionList3");
	}




	public ArrayList<Show> concertRegionList4(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.concertRegionList4");
	}




	public ArrayList<Show> concertRegionList5(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("showInfoMapper.concertRegionList5");
	}




	public ArrayList<Show> concertRegionList6(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("showInfoMapper.concertRegionList6");
	}




	public ArrayList<Show> classicShowList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.classicShowList");
	}




	public ArrayList<Show> classicRegion1(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.classicRegion1");
	}




	public ArrayList<Show> classicRegion2(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.classicRegion2");
	}




	public ArrayList<Show> classicRegion3(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.classicRegion3");
	}




	public ArrayList<Show> classicRegion4(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.classicRegion4");
	}




	public ArrayList<Show> classicRegion5(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.classicRegion5");
	}




	public ArrayList<Show> classicRegion6(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.classicRegion6");
	}




	public ArrayList<Show> displayShow(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.displayShow");
	}




	public ArrayList<Show> displayRegion1(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.displayRegion1");
	}




	public ArrayList<Show> displayRegion2(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.displayRegion2");
	}




	public ArrayList<Show> displayRegion3(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.displayRegion3");
	}




	public ArrayList<Show> displayRegion4(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.displayRegion4");
	}




	public ArrayList<Show> displayRegion5(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.displayRegion5");
	}




	public ArrayList<Show> displayRegion6(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.displayRegion6");
	}




	public ArrayList<Show> searchBox(SqlSessionTemplate sqlSession, HashMap<String, String> hashMap) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.searchBox",hashMap);
	}




	public int searchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> hashMap) {
		
		return sqlSession.selectOne("showInfoMapper.searchListCount",hashMap);
	}




	public ArrayList<Show> musicalRegion0(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.musicalRegion0");
	}




	public ArrayList<Show> playRegion0(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.playRegion0");
	}




	public ArrayList<Show> concertRegion0(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.concertRegion0");
	}




	public ArrayList<Show> classicRegion0(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.classicRegion0");
	}




	public ArrayList<Show> displayRegion0(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.displayRegion0");
	}




	public ArrayList<Show> mainRegionRank(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("showInfoMapper.mainRegionRank");
	}
	
	// 리뷰조회
	public ArrayList<Review> selectReview(SqlSession session) {
		ArrayList<Review> list = (ArrayList)session.selectList("showInfoMapper.selectReview");
		return list;
	}

	public int selectRcount(SqlSession session) {
		return session.selectOne("showInfoMapper.selectRcount");
	}

	public ArrayList<Review> reviewSearch(SqlSession session, String keyword) {

		return (ArrayList)session.selectList("showInfoMapper.reviewSearch",keyword);
	}

	public int searchRcount(SqlSession session, String keyword) {
		return session.selectOne("showInfoMapper.searchRcount",keyword);
	}




	public int enrollReview(SqlSession session, Review r) {
		return session.insert("showInfoMapper.enrollReview",r);
	}




	public Review searchReview(SqlSession session, int replyNo) {
		return (Review)session.selectOne("showInfoMapper.searchReview",replyNo);
	}




	public int updateReview(SqlSession session, Review r) {
		return session.update("showInfoMapper.updateReview",r);
	}




	public int deleteReview(SqlSession session, int replyNo) {
		return session.update("showInfoMapper.deleteReview",replyNo);
	}




	public Show selectWithName(SqlSession session, String name) {
		return session.selectOne("showInfoMapper.selectWithName",name);
	}

}
