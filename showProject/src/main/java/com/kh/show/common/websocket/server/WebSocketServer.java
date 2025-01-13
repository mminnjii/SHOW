package com.kh.show.common.websocket.server;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.show.chat.model.service.ChatService;
import com.kh.show.chat.model.vo.ChatMessage;
import com.kh.show.member.model.service.MemberService;
import com.kh.show.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketServer extends TextWebSocketHandler{
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private MemberService memberService;
	
	// 저장소 Map 형태로 
	private HashMap<Integer, Set<WebSocketSession>> chatUser = new HashMap<>();

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("접속");
		log.debug("WebSocket session : \n{}", session);
		log.debug("정보 : {}", session.getAttributes().get("loginUser"));
		
		Member loginUser = (Member)session.getAttributes().get("loginUser");
		int chatNo = (int)session.getAttributes().get("chatNo");
		
		log.debug("chatNo : {}", (int)session.getAttributes().get("chatNo"));

		Set<WebSocketSession> users = new CopyOnWriteArraySet<>();
		users = chatUser.get(chatNo);
	
		if(users == null) {
			users = new CopyOnWriteArraySet<>();
			chatUser.put(chatNo, users);
		}
		
		users.add(session);
		
		HashMap<String,Object> join = new HashMap<>();
		join.put("userNo", loginUser.getUserNo());
		join.put("chatNo", chatNo);
		
		int result1 = chatService.selectJoinUser(join);
		System.out.println("result1 : " + result1);
		
		if(result1>0){
			log.debug("저장되어 있는 회원");
		}else {
			int result = chatService.insertJoin(join);
		}
		
		ArrayList<Member> userList = new ArrayList<>();
		
		for(WebSocketSession s: users) {
			loginUser = (Member)s.getAttributes().get("loginUser");
			userList.add(loginUser);
			log.debug("모든 사용자 : {}", loginUser);
		}
		
		
		log.debug("loginUser : {}", loginUser);
		log.debug("chatNo : {}", chatNo);
		log.debug("현재 접속자수 : {}", users.size());

		HashMap<String, Object> joinUser = new HashMap<>();
		joinUser.put("userList", userList);
		joinUser.put("joinSize", users.size());
		
		String responseMsg = new Gson().toJson(joinUser);
		TextMessage tm = new TextMessage(responseMsg);
		
		for(WebSocketSession ws : users) {
			ws.sendMessage(tm); 
		}
		
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log.debug("메시지 수신 : {}", message.getPayload());
		String changeMessage = message.getPayload();
		
		if((changeMessage.equals(null)) || (changeMessage.equals(""))) {
			changeMessage = " ";
		}
		
		Member loginUser = (Member)session.getAttributes().get("loginUser");
		int userNo = loginUser.getUserNo();
		int chatNo = (int)session.getAttributes().get("chatNo");
		System.out.println(loginUser);
		
		ChatMessage cm = ChatMessage.builder()
									.chatContent(changeMessage)
									.userNo(userNo)
									.chatNo(chatNo)
									.build();
		
		int result = chatService.chatMessage(cm);
		
		if(result>0) {
			log.debug("메시지 저장 성공");
			
			HashMap<String, Object> infoMap = new HashMap<>();
			infoMap.put("mem", loginUser);
			infoMap.put("cm", cm);
			
			String responseMsg = new Gson().toJson(infoMap);
			TextMessage tm = new TextMessage(responseMsg);
			
			Set<WebSocketSession> users = chatUser.get(chatNo);
			for(WebSocketSession wsm : users) {
				wsm.sendMessage(tm); 
			}
			
		}else {
			log.debug("메시지 저장 실패");
		}
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		log.debug("접속 종료");
		
		int chatNo = (int)session.getAttributes().get("chatNo");
		Set<WebSocketSession> users = chatUser.get(chatNo);
		users.remove(session);

		ArrayList<Member> userList = new ArrayList<>();
		
		for(WebSocketSession s: users) {
			Member loginUser = (Member)s.getAttributes().get("loginUser");
			userList.add(loginUser);
		}
		
		
		HashMap<String, Object> joinUser = new HashMap<>();
		joinUser.put("userList", userList);
		joinUser.put("joinSize", users.size());
		
		String responseMsg = new Gson().toJson(joinUser);
		TextMessage tm = new TextMessage(responseMsg);
		
		for(WebSocketSession ws : users) {
			ws.sendMessage(tm); 
		}
		
		
		log.debug("Websocket session : {}",session);
		log.debug("CloseStatus : {}",status);
		log.debug("현재 접속자수 : {}", users.size());
		
	}
	
}
