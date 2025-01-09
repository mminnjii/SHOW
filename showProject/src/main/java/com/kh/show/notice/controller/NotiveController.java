package com.kh.show.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.show.common.template.PageInfo;
import com.kh.show.common.template.Pagenation;
import com.kh.show.notice.model.service.NoticeService;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.notice.model.vo.OpenNotice;

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
		int pageLimit = 10;  	// 페이징바 최대 개수 
		int boardLimit = 10; 	// 한 페이지에 보여질 게시글 개수
		
		// 페이징 처리를 위한 요소 가지고 오기 
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 리스트 조회하기 (defalt 일반 공지)
		ArrayList<Notice> noticeList = noticeService.selectList(pi);
		
		m.addAttribute("noticeList", noticeList);
		m.addAttribute("pi", pi);
		
		return "/notice/noticeView";
	}
	
	// 데이터 그대로 전달 
	@ResponseBody
	@PostMapping(value="/list", produces = "application/json; charset=UTF-8")
	public ArrayList<Notice> noticeList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage){
		
		// 페이징 처리 
		int listCount = noticeService.listCount(); // 공지사항 개수 count 
		int pageLimit = 10;  	// 페이징바 최대 개수 
		int boardLimit = 10; 	// 한 페이지에 보여질 게시글 개수
		
		// 페이징 처리를 위한 요소 가지고 오기 
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 리스트 조회하기 (defalt 일반 공지)
		ArrayList<Notice> noticeList = noticeService.selectList(pi);
		
		return noticeList;
	}
	
	
	// 공지사항 검색 목록  - 페이징 처리 해줘야 한다. 
	@GetMapping("/search")
	public String searchNotice(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage
														,String condition
														,String keyword
														,Model m){
		
		// 하나에 묶어서 전달해야 하기 때문에 전달받은 검색 조건을 맵에 담아 전달 
		HashMap<String,String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		// 검색 목록 개수 - 검색 키워드에 따라 검색해야 한다.
		int searchCount = noticeService.searchCount(map);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		// 페이징 처리를 위한 검색 목록 개수 
		PageInfo pi = Pagenation.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		// 검색 목록
		ArrayList<Notice> noticeList = noticeService.searchNotice(map, pi);
		
		m.addAttribute("noticeList",noticeList);
		m.addAttribute("pi", pi);
		m.addAttribute("map", map);
		
		return "/notice/noticeView";
	}

	
	// 공지사항 상세페이지
	@ResponseBody
	@PostMapping("/detail")
	public Notice noticeDetail(int nno) {
		
		System.out.println(nno);
		
		// 공지사항 조회수 up 
		int result = noticeService.noticeUpCount(nno);
		
		Notice noticeDetail = null;
		
		if(result>0) {
			// 공지사항 상세정보 
			noticeDetail = noticeService.noticeDetail(nno);
			
			String noticeContent = noticeDetail.getNoticeContent();
			noticeContent = noticeContent.replace("\n", "<br>");
			noticeDetail.setNoticeContent(noticeContent);
					
		} 
		
		return noticeDetail; 
	}
		
	
	// 오픈공지 목록 
	// 데이터 그대로 전달 
	@ResponseBody
	@PostMapping(value="/openlist", produces = "application/json; charset=UTF-8")
	public ArrayList<OpenNotice> openNoticeList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage){
		
		// 페이징 처리 
		int listCount = noticeService.openlistCount(); // 공지사항 개수 count 
		int pageLimit = 10;  	// 페이징바 최대 개수 
		int boardLimit = 10; 	// 한 페이지에 보여질 게시글 개수
		
		// 페이징 처리를 위한 요소 가지고 오기 
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 리스트 조회하기 (defalt 일반 공지)
		ArrayList<OpenNotice> noticeList = noticeService.selectOpenList(pi);
		
		// 문자열 \n 줄바꿈 html 줄바꿈 태그로 변경
		for(OpenNotice on : noticeList) {
			String openExplain = on.getOpenExplain();
			openExplain = openExplain.replace("\n", "<br>");
			on.setOpenExplain(openExplain);
		}
		
		return noticeList;
	}
	
	@GetMapping("/open")
	public String open(HttpSession session,String showName) {
		
		
		Notice s = noticeService.openSelect(showName);
		session.setAttribute("s", s);
		//System.out.println(s);
		
		return "notice/ticketOpenPage";
		
	}
	
	
}



