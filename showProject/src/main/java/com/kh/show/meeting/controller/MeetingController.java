package com.kh.show.meeting.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.show.common.template.PageInfo;
import com.kh.show.common.template.Pagenation;
import com.kh.show.meeting.model.service.MeetingService;
import com.kh.show.meeting.model.vo.Meeting;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("meeting")
public class MeetingController {

	@Autowired
	private MeetingService meetingService;
	
	@GetMapping("list")
	public String meetingHome(Model m, @RequestParam(value="currentPage", defaultValue = "1") int currentPage) {
		
		
		log.info("소모임 페이지");
		
		// 페이징 처리 
		int listCount = meetingService.listCount();
		int PageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, PageLimit, boardLimit);
		
		// 소모임 리스트 
		ArrayList<Meeting> meList = meetingService.meetingList(pi);
		
		m.addAttribute("meList", meList);
		m.addAttribute("pi",pi);
		
		for(Meeting me : meList) {
			System.out.println(me);
		}
		
		return "meeting/meeting";
	}

	// 소모임 생성 페이지 이동
	@GetMapping("create")
	public String createView() {
		return "meeting/meetingInsert";
	}

}
