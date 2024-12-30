package com.kh.show.meeting.controller;

import java.util.ArrayList;

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
import com.kh.show.meeting.model.service.MeetingService;
import com.kh.show.meeting.model.vo.Meeting;
import com.kh.show.showInfo.model.vo.Genre;
import com.kh.show.showInfo.model.vo.Show;

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
	public String createView(Model m) {
		
		ArrayList<Genre> genreList = meetingService.selectGenre();
		
		m.addAttribute("genreList", genreList);
		
		return "meeting/meetingInsert";
	}
	
	// 공연 목록 리스트
	@ResponseBody
	@GetMapping("selectShow")
	public ArrayList<Show> selMeetingShow(int genreNo){
		
		ArrayList<Show> showList = meetingService.selMeetingShow(genreNo);

		return showList;
	}
	
	// 소모임 생성 메소드 
	@PostMapping("meetingInsert")
	public String meetingInsert(HttpSession session, Meeting m) {
		
		int result = meetingService.meetingInsert(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "소모임 생성이 완료되었습니다. 내 모임은 마이페이지에서 확인하실 수 있습니다.");
		}
		
		return "redirect:list";
	}
	
	// 소모임 상세화면 이동 메소드
	@GetMapping("meetingDetail")
	public String meetingDetail(String mno, Model m) {
		
		System.out.println(mno);
		Meeting meDetail = meetingService.meetingDetail(Integer.parseInt(mno));
		
		System.out.println(meDetail);
		
		m.addAttribute("meDetail", meDetail);
		
		return "meeting/meetingDetail";
	}
	
	
	
}
