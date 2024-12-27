package com.kh.show.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.show.common.template.PageInfo;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.notice.model.vo.OpenNotice;

public interface NoticeService {
	
	// 리스트 개수
	int listCount();

	// 일반공지 리스트 
	ArrayList<Notice> selectList(PageInfo pi);

	// 검색 리스트 개수 
	int searchCount(HashMap<String, String> map);

	// 일반공지 검색 목록 
	ArrayList<Notice> searchNotice(HashMap<String, String> map, PageInfo pi);

	// 공지 상세보기 
	Notice noticeDetail(int nno);

	// 공지사항 조회수 up 
	int noticeUpCount(int nno);

	// 오픈공지 리스트 개수 
	int openlistCount();

	// 오픈 공지 목록 
	ArrayList<OpenNotice> selectOpenList(PageInfo pi);

}
