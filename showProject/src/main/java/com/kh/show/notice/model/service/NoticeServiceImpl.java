package com.kh.show.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.common.template.PageInfo;
import com.kh.show.notice.model.dao.NoticeDao;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.notice.model.vo.OpenNotice;
import com.kh.show.showInfo.model.vo.Show;

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
	@Override
	public Notice noticeDetail(int nno) {
		return noticeDao.noticeDetail(sqlSession, nno);
	}

	// 공지사항 조회수 up 
	@Override
	public int noticeUpCount(int nno) {
		return noticeDao.noticeUpCount(sqlSession, nno);
	}

	// 오픈공지 개수 
	@Override
	public int openlistCount() {
		return noticeDao.openlistCount(sqlSession);
	}

	// 오픈공지 목록 
	@Override
	public ArrayList<OpenNotice> selectOpenList(PageInfo pi) {
		return noticeDao.selectOpenList(sqlSession, pi);
	}

	//오픈공지 상세페이지
	@Override
	public Notice openSelect(String showName) {
		
		return noticeDao.openSelect(sqlSession, showName);
	}

}
