package com.kh.show.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.show.chat.model.service.ChatService;
import com.kh.show.chat.model.vo.Chat;
import com.kh.show.common.template.PageInfo;
import com.kh.show.common.template.Pagenation;
import com.kh.show.meeting.model.service.MeetingService;
import com.kh.show.showInfo.model.vo.Genre;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("chat")
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private MeetingService meetingService;
	
	@GetMapping("list")
	public String chatMain(@RequestParam (value="currentPage", defaultValue = "1") int currentPage , Model m) {
		
		
		log.debug("채팅방 리스트");
		
		// 페이징 처리 
		int listCount = chatService.listCount();
		int pageLimit = 10;
		int voardLimit = 10;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, voardLimit);
		
		// 소모임 리스트 
		ArrayList<Chat> chatList = chatService.chatList(pi);
		
		for(Chat c : chatList) {
			System.out.println(c);
		}
		
		m.addAttribute("pi", pi);
		m.addAttribute("chatList", chatList);
		
		return "chat/chat";
	}
	
	// 채팅방 생성 페이지 이동
	@GetMapping("chatView")
	public String chatView(Model m) {
		
		ArrayList<Genre> genreList = meetingService.selectGenre();
		
		m.addAttribute("genreList", genreList);
		
		return "chat/chatInsert";
	}
	
	
	// 채팅방 생성 insert 
	@PostMapping("chatInsert")
	public String chatInsert(Chat c, HttpSession session) {
		
		System.out.println(c);
		
		int result = chatService.chatInsert(c);
		
		// 채팅방 생성이 완료되면 해당 채팅방으로 바로 이동 및 alert 메시지 
		if(result>0) {
			session.setAttribute("alertMsg", "채팅방 생성이 완료되었습니다. 채팅방으로 이동됩니다.");
			return "redirect:list";  // 채팅방 경로로 수정해야 한다.
			
		}else { // 생성되지 않으면 커뮤니티 리스트 페이지로 이동 및 alert 메시지 
			session.setAttribute("alertMsg", "채팅방 생성이 불가능합니다. 다시 생성해 주세요.");
		}
		
		return "chat/chat";
	}
	
		
	// 채팅 페이지 
	@GetMapping("chatting")
	public String chattingDetail(String userId, int chatNo, ModelAndView mv) {
	 
		System.out.println("userId : " + userId);
	    System.out.println("chatNo : " + chatNo);
	    
	    return "chat/chatDetail";
	}
	
		
}
