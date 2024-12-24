package com.kh.show.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.show.common.model.vo.PageInfo;
import com.kh.show.common.template.Pagenation;
import com.kh.show.notice.model.service.NoticeService;
import com.kh.show.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NotiveController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/list")
	public String noticeList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model m) {
		
		// 페이징 처리 
		int listCount = noticeService.listCount(); // 공지사항 개수 count 
		int pageLimit = 10; 
		int boardLimit = 10;
		
		// 페이징 처리를 위한 요소 가지고 오기 
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 리스트 조회하기 (defalt 일반 공지)
		ArrayList<Notice> notiveList = noticeService.selectList(pi);
		
		m.addAttribute("notiveList", notiveList);
		m.addAttribute("pi", pi);
		
		
		return "/notice/notice";
	}
	
}
