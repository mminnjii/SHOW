package com.kh.show.notice.model.service;

import java.util.ArrayList;

import com.kh.show.common.model.vo.PageInfo;
import com.kh.show.notice.model.vo.Notice;

public interface NoticeService {
	
	// 리스트 개수세기 
	int listCount();

	// 일반공지 리스트 
	ArrayList<Notice> selectList(PageInfo pi);

}
