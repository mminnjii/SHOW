package com.kh.show.chat.controller;

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

import com.kh.show.chat.model.service.ChatService;
import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ChatJoin;
import com.kh.show.chat.model.vo.ChatMessage;
import com.kh.show.common.template.PageInfo;
import com.kh.show.common.template.Pagenation;
import com.kh.show.meeting.model.service.MeetingService;
import com.kh.show.member.model.vo.Member;
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
		
		// 채팅방 리스트 
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
		int chatNo = chatService.selectChatNo();
		c.setChatNo(chatNo);
		int result = chatService.chatInsert(c);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		// 채팅방 생성이 완료되면 해당 채팅방으로 바로 이동 및 alert 메시지 
		if(result>0) {
			session.setAttribute("alertMsg", "채팅방 생성이 완료되었습니다. 채팅방으로 이동됩니다.");
			return "redirect:/chat/chatting?chatNo="+chatNo+"&userId="+userId;  // 채팅방 경로로 수정해야 한다.
			
		}else { // 생성되지 않으면 커뮤니티 리스트 페이지로 이동 및 alert 메시지 
			session.setAttribute("alertMsg", "채팅방 생성이 불가능합니다. 다시 생성해 주세요.");
		}
		
		return "chat/list";
	}
	
	// 채팅방 검색
	@GetMapping("chatSearch")
	public String chatSearch(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
									  String condition , String keyword, Model m ){
		
		HashMap<String,String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("condition", condition);
		
		System.out.println(condition);
		
		// 채팅방 검색 개수 
		int listCount = chatService.searchListCount(map);
		int pageLimit = 10;
		int voardLimit = 10;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, voardLimit); 
		
		// 채팅방 검색 목록 
		ArrayList<Chat> chatList = chatService.searchChatList(map, pi);
		
		System.out.println("listCount : " + listCount);

		for(Chat c : chatList) {
			System.out.println(c);
		}

		m.addAttribute("pi", pi);
		m.addAttribute("map", map);
		m.addAttribute("chatList", chatList);
		
		return "chat/chat";
	}
	
	// 채팅 페이지 
	@GetMapping("chatting")
	public String chattingDetail(String userId, int chatNo, HttpSession session, Model m) {
	 
	    session.setAttribute("chatNo", chatNo);
	    
	    // 채팅방 상세 정보 
	    Chat chatInfo = chatService.selectChatInfo(chatNo);
	    session.setAttribute("chatInfo", chatInfo);
	    
	    // 채팅방 메시지 담은 List 
	    ArrayList<ChatMessage> chatMeList = chatService.selectChatList(chatNo);
	    
	    m.addAttribute("chatMeList", chatMeList);
	    
	    return "chat/chatDetail";
	}
	
	
	// 나가기 버튼 클릭시 join테이블의 데이터 삭제 
	@PostMapping("joinDelete")
	public String joinDelete(ChatJoin cj) {
		
		// chat_join 회원 데이터 삭제
		int result = chatService.joinDelete(cj);
		
		return "chat/chat";
	}
	
	// 채팅방 삭제 
	@PostMapping("deleteChat")
	public String deleteChat(int chatNo) {
		
		// chat_join 회원 데이터 삭제
		int result = chatService.deleteChat(chatNo);
		
		return "chat/chat";
	}
	
	// 채팅방에 join되어 있는 회원인지 확인하는 메소드 
	@ResponseBody
	@PostMapping("joinUser")
	public ChatJoin joinUser(ChatJoin cj) {

		log.debug("cj : {}", cj);
		
		ChatJoin joinUser = chatService.joinUser(cj);
		log.debug("joinUser : {}", joinUser);
		
		return joinUser;
	}

	
		
}
