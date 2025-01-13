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
		//연결이 되었을때 동작하는 메소드 
		log.debug("접속");
		log.debug("WebSocket session : \n{}", session);
		//해당 속성중 loginUser라는 key값으로 value 추출
		log.debug("정보 : {}", session.getAttributes().get("loginUser"));
		
		// 회원의 정보와 입장한 채팅방 번호를 가져온다. 
		Member loginUser = (Member)session.getAttributes().get("loginUser");
		int chatNo = (int)session.getAttributes().get("chatNo");
		
		log.debug("chatNo : {}", (int)session.getAttributes().get("chatNo"));

		// 채팅방 번호와 user 세션 정보 map에 저장
		Set<WebSocketSession> users = new CopyOnWriteArraySet<>();
		users = chatUser.get(chatNo);
	
		// 세션이 없을 경우 java.lang.NullPointerException 발생. 
		// 새로운 socket 저장소 생성 후 chatUser에 추가 후 접속자의 session 추가
		if(users == null) {
			users = new CopyOnWriteArraySet<>();
			chatUser.put(chatNo, users);
		}
		
		// 현재 접속한 사용자의 세션 추가
		users.add(session);
		
		// 회원 번호와 회원이 입장한 채팅방 번호 전달하여 DB 저장 
		// 전달받은 userId와 chatNo를 DB에 저장한다. 
		// 이미 정보가 있으면 저장하지 않도록 한다
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
		
		// 접속자 전달하기 위한 리스트
		ArrayList<Member> userList = new ArrayList<>();
		
		// 접속자들의 정보를 List로 담아 전달 (socket 저장소에 저장된 회원들)
		for(WebSocketSession s: users) {
			loginUser = (Member)s.getAttributes().get("loginUser");
			userList.add(loginUser);
			log.debug("모든 사용자 : {}", loginUser);
		}
		
		log.debug("loginUser : {}", loginUser);
		log.debug("chatNo : {}", chatNo);
		log.debug("현재 접속자수 : {}", users.size());

		// 채팅방에 들어온 회원의 정보와 명수를 전달한다.
		HashMap<String, Object> joinUser = new HashMap<>();
		joinUser.put("userList", userList);
		joinUser.put("joinSize", users.size());
		
		// 메시지 정보 Json으로 변환해서 전달
		String responseMsg = new Gson().toJson(joinUser);
		TextMessage tm = new TextMessage(responseMsg);
		
		// 채팅방의 모든 사용자에게 메시지 전달. 
		for(WebSocketSession ws : users) {
			ws.sendMessage(tm); 
		}
		
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 사용자에게 입력받은 메시지를 접속해 있는 모든 사용자에게 전달해야 한다.  : getPayload() : 메시지 본문 반환 
		log.debug("메시지 수신 : {}", message.getPayload());
		String changeMessage = message.getPayload();
		
		// 전달받은 메시지가 없는 경우 공백 처리해서 DB에 저장 
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
		
		// 전달받은 메시지 정보를 DB에 저장
		int result = chatService.chatMessage(cm);
		
		if(result>0) {
			log.debug("메시지 저장 성공");
			
			// member쪽 삭제 필요. vo에도 profile 관련 코드 삭제 
			// Member mem = memberService.selectChatMem(userNo);
			
			// 메시지를 보낸 사용자와 메시지 정보를 담아 전달
			HashMap<String, Object> infoMap = new HashMap<>();
			infoMap.put("mem", loginUser);
			infoMap.put("cm", cm);
			
			// 메시지 정보 VO를 JSON 문자열로 변환하여 전달. 
			String responseMsg = new Gson().toJson(infoMap);
			// 메시지 객체 생성 
			TextMessage tm = new TextMessage(responseMsg);
			
			// 채팅방의 모든 사용자에게 메시지 전달
			// 해당되는 채팅방의 사용자만 가져옴
			Set<WebSocketSession> users = chatUser.get(chatNo);
			// 사용자에게 메시지 전달
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
		
		// 해당 채팅방의 회원 session 삭제
		int chatNo = (int)session.getAttributes().get("chatNo");
		Set<WebSocketSession> users = chatUser.get(chatNo);
		users.remove(session);

		// 사용자가 나간 경우 해당 세션 정보를 다시 보내서 실시간으로 반영 
		ArrayList<Member> userList = new ArrayList<>();
		
		// 접속자들의 정보를 리스트 생성 (socket 저장소에 저장된 회원들)
		for(WebSocketSession s: users) {
			Member loginUser = (Member)s.getAttributes().get("loginUser");
			userList.add(loginUser);
		}
		
		// 채팅방에 들어온 회원의 정보와 명수를 전달한다.
		HashMap<String, Object> joinUser = new HashMap<>();
		joinUser.put("userList", userList);
		joinUser.put("joinSize", users.size());
		
		String responseMsg = new Gson().toJson(joinUser);
		TextMessage tm = new TextMessage(responseMsg);
		
		// 채팅방의 모든 사용자에게 메시지 전달. 
		for(WebSocketSession ws : users) {
			ws.sendMessage(tm); 
		}
		
		
		log.debug("Websocket session : {}",session);
		log.debug("CloseStatus : {}",status);
		log.debug("현재 접속자수 : {}", users.size());
		
	}
	
}
