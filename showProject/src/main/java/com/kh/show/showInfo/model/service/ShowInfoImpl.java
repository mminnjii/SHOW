package com.kh.show.showInfo.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.showInfo.model.dao.ShowInfoDao;
import com.kh.show.showInfo.model.vo.Review;
import com.kh.show.showInfo.model.vo.Show;
import com.kh.show.showInfo.model.vo.ShowRound;

@Service
public class ShowInfoImpl implements ShowInfoService {

	@Autowired
	 private ShowInfoDao showInfoDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	@Override
	public Show selectShow() {
		Show s = showInfoDao.selectShow(sqlSession);
		return s;
	}
	

	@Override
	public ArrayList<ShowRound> selectRound() {
		ArrayList<ShowRound> round  = showInfoDao.selectRound(sqlSession);
		return round;
	}
	
	@Override
	public ArrayList<Review> selectReview() {
		ArrayList<Review> list = showInfoDao.selectReview(sqlSession);
		return list;
	}


	@Override
	public int selectRcount() {
		return showInfoDao.selectRcount(sqlSession);
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


	
	

}
