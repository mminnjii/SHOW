package com.kh.show.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.common.template.PageInfo;
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

	// 검색 목록 개수 
	@Override
	public int searchCount(HashMap<String, String> map) {

		return noticeDao.searchCount(sqlSession, map);
	}
	
	// 검색 목록 정보 메소드 
	@Override
	public ArrayList<Notice> searchNotice(HashMap<String, String> map, PageInfo pi) {
	
		return noticeDao.searchNotice(sqlSession, map, pi);
	}

	// 공지사항 상세보기 
//	@Override
//	public Notice noticeDetail(int nno) {
//		return noticeDao.noticeDetail(sqlSession, nno);
//	}

}
