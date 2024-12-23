package com.kh.show.notice.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.common.model.vo.PageInfo;
import com.kh.show.notice.model.dao.NoticeDao;
import com.kh.show.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 리스트 개수 
	@Override
	public int listCount() {

		return noticeDao.listCount(sqlSession);
	}

	// 리스트 목록 조회 메소드 
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {

		return noticeDao.selectList(sqlSession, pi);
	}

}
