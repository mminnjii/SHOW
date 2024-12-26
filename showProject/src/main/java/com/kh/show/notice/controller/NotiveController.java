package com.kh.show.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	//@ResponseBody
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

		
//	@ResponseBody    // ajax 처리로 변경. -> json 객체로 전달.
//	@GetMapping(value="/list", produces = "application/json; charset=UTF-8")
//	public HashMap<String, Object> noticeList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage
//											,@RequestParam(value = "category", defaultValue = "1") String category) {
//		// @ResponseBody와 Model 객체를 같이 사용하면 충돌이 발생할 수 있다. => map에 넣어서 전달.
//		// 페이징 처리 
//		
//		System.out.println(currentPage);
//		
//		int listCount = noticeService.listCount(); // 공지사항 개수 count 
//		int pageLimit = 10;  	// 페이징바 최대 개수 
//		int boardLimit = 10; 	// 한 페이지에 보여질 게시글 개수
//		
//		// 페이징 처리를 위한 요소 가지고 오기 
//		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
//		
//		ArrayList<Notice> noticeList = new ArrayList<>();
//		
//		// 1이면 일반 공지 , 2면 티켓 공지 
//		if(category.equals("1")) { 
//			// 리스트 조회하기 (defalt 일반 공지)
//			noticeList = noticeService.selectList(pi);
//		}else {
//			
//		}
//		
//		
//		HashMap<String, Object> resultMap = new HashMap<>();
//		resultMap.put("noticeList", noticeList);
//		resultMap.put("pi", pi);
//		
//		return resultMap;
//	}
//	
	
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
//	@GetMapping("detail")
//	public ModelAndView noticeDetail(int nno, ModelAndView mv, HttpSession session) {
//		
//		System.out.println(nno);
//		
//		// 공지사항 조회수 up 
//		int result = noticeService.noticeUpCount(nno);
//		
//		if(result>0) {
//			// 공지사항 상세정보 
//			Notice notice = noticeService.noticeDetail(nno);
//			
//			mv.addObject("nDetail", notice);
//			System.out.println(notice);
//			
//		} else {
//			session.setAttribute("alertMsg", "공지사항 조회에 실패하였습니다.");
//		}
//		
//
//		mv.setViewName("/notice/noticeDetail");
//		
//		return mv;
//	}
	
	
	// 공지사항 상세페이지
	@ResponseBody
	@PostMapping("/detail")
	public Notice noticeDetail(@RequestParam("nno") int nno) {
		
		System.out.println(nno);
		
		// 공지사항 조회수 up 
		int result = noticeService.noticeUpCount(nno);
		
		Notice noticeDetail = null;
		
		if(result>0) {
			// 공지사항 상세정보 
			noticeDetail = noticeService.noticeDetail(nno);
			
			System.out.println("detail : "+ noticeDetail);
			
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
		
		return noticeList;
	}
	
	
}



