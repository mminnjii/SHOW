package com.kh.show.showInfo.model.dao;

import java.util.ArrayList;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.showInfo.model.vo.Review;
import com.kh.show.showInfo.model.vo.Show;
import com.kh.show.showInfo.model.vo.ShowRound;

@Repository
public class ShowInfoDao {

	
	
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







	
	
}
