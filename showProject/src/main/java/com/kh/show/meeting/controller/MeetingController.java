package com.kh.show.meeting.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.kh.show.meeting.model.service.MeetingService;
import com.kh.show.meeting.model.vo.Meeting;
import com.kh.show.meeting.model.vo.MeetingJoin;
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
		int boardLimit = 10;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, PageLimit, boardLimit);
		
		// 소모임 리스트 
		ArrayList<Meeting> meList = meetingService.meetingList(pi);
		
		// 소모임 리스트에서 status 값을 sysdate 현재 시간과 비교해서 구인 마감 날짜가 지난 경우 status값을 n으로 바꿔준다.
		for (Meeting ml : meList) {

			String endDate = new SimpleDateFormat("yyyy-MM-dd").format(ml.getEndDate());
			
			Date date = new Date();
			String sysDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
			
			// sysDate가 endDate보다 큰 경우 STATUS값 N으로 변경. 음수면 endDate가 더 크다는 것 
			int compare = sysDate.compareTo(endDate);
			
			int meetingNo = ml.getMeetingNo();
			
			if(compare > 0) {
				int result = meetingService.updateStatus(meetingNo);
			}
			
			System.out.println(ml);
		}
		
		// 업데이트 된 경우 리스트를 다시 불러와야 한다. 
		meList = meetingService.meetingList(pi);
		
		
		m.addAttribute("meList", meList);
		m.addAttribute("pi",pi);
		
		
		return "meeting/meeting";
	}

	// 소모임 생성 페이지 이동
	@GetMapping("create")
	public String createView(Model m) {
		
		ArrayList<Genre> genreList = meetingService.selectGenre();
		
		m.addAttribute("genreList", genreList);
		
		for(Genre g : genreList) {
			System.out.println(g);
		}
		
		return "meeting/meetingInsert";
	}
	
	// 공연 목록 리스트
	@ResponseBody
	@GetMapping("selectShow")
	public ArrayList<Show> selMeetingShow(int genreNo){
		
		ArrayList<Show> showList = meetingService.selMeetingShow(genreNo);

		return showList;
	}

	// 공연 검색 메소드 - insert
	@ResponseBody
	@GetMapping("searchShow")
	public ArrayList<Show> selSearchShow(int genreNo, String keyword){
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("genreNo", genreNo);
		
		System.out.println(keyword+"    "+ genreNo);
		
		ArrayList<Show> showList = meetingService.selSearchShow(map);

		return showList;
	}
	
	
	
	// 소모임 생성 메소드 
	@PostMapping("meetingInsert")
	public String meetingInsert(HttpSession session, Meeting m) {
		
		// meetingNo의 값을 미리 가져와야 한다. 
		int meetingNo = meetingService.selectMeetingNo();
		m.setMeetingNo(meetingNo);
		int result = meetingService.meetingInsert(m);
		
		if(result>0) {
			//소모임 join테이블에 저장되어야 한다.
			MeetingJoin mj = new MeetingJoin(meetingNo, Integer.parseInt(m.getUserNo()));
			System.out.println(mj);
			int result2 = meetingService.meetingJoin(mj); 

			if((result*result2) >0) {
				session.setAttribute("alertMsg", "소모임 생성이 완료되었습니다. 내 모임은 마이페이지에서 확인하실 수 있습니다.");
			}
		} else {
			session.setAttribute("alertMsg", "소모임 생성이 불가능 합니다. 다시 시도해 주세요.");
			
		}
		
		return "redirect:list";
	}
	
	// 소모임 상세화면 이동 메소드
	@GetMapping("meetingDetail")
	public String meetingDetail(String mno, Model m) {
		
		// 상세화면 
		Meeting meDetail = meetingService.meetingDetail(Integer.parseInt(mno));
		// 소모임 참여 인원 count
		int meetingCount = meetingService.meetingCount(mno);
		m.addAttribute("meetingCount", meetingCount);
		
		String infomation = meDetail.getInfomation();
		if(infomation != null) {
			infomation = infomation.replace("\n", "<br>");
		}
		meDetail.setInfomation(infomation);
		
		m.addAttribute("meDetail", meDetail);
		
		
		return "meeting/meetingDetail";
	}
	
	// 소모임 참여 
	@ResponseBody
	@GetMapping("join")
	public int meetingJoin(MeetingJoin mj) { 
	
		int result= 0;
		
		// 하나의 소모임에 한번만 참여할 수 있도록 제한.
		// 1. 회원 참여 이력이 있는지 확인 
		boolean sjUser = meetingService.searchJoinUser(mj); 
		
		if(sjUser) {
			result = 0;
		}else {
			result = meetingService.meetingJoin(mj);
		}
		
		System.out.println(result);
		return result;
	}
	
	// 소모임 참여 취소 
	@ResponseBody
	@PostMapping("joinCancle")
	public int joinCancle(MeetingJoin mj) {
		
		int result= 0;
		// 회원이 아이디가 join 테이블에 있는지 확인하고 삭제. 
		
		// 하나의 소모임에 한번만 참여할 수 있도록 제한.
		// 1. 회원 참여 이력이 있는지 확인 
		boolean sjUser = meetingService.searchJoinUser(mj); 
		
		System.out.println(sjUser);
		
		if(sjUser) {
			result = meetingService.joinCancle(mj);
		}else {
			result = 0;
		}
		
		return result;
	}
	
	
	// 소모임 검색  | 페이징 처리도 해야 한다. 
	@GetMapping("search")
	public String  searchMeetingList(@RequestParam(value="currentPage", defaultValue = "1") int currentPage, 
												String condition, String keyword, Model m){
		
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("keyword", keyword);
		hashmap.put("condition", condition);
		
		// 페이징 처리 
		int listCount = meetingService.searchCount(hashmap);
		int PageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, PageLimit, boardLimit);
		
		ArrayList<Meeting> meList = meetingService.searchMeetingList(pi, hashmap);
		
		m.addAttribute("meList", meList);
		m.addAttribute("pi",pi);
		m.addAttribute("hashmap", hashmap);
		
		return "meeting/meeting";
	}
	
	// 소모임 삭제 메소드 
	@PostMapping("deleteMeeting")
	public String deleteMeeting(int meetingNo) {
		System.out.println(meetingNo);
		
		int result = meetingService.deleteMeeting(meetingNo);
		
		return "meeting/meeting";
	}
	
}
