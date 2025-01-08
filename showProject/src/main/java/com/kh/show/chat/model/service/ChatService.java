package com.kh.show.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ChatJoin;
import com.kh.show.chat.model.vo.ChatMessage;
import com.kh.show.common.template.PageInfo;

public interface ChatService {

	// 채팅방 목록 개수 
	int listCount();
	
	// 채팅방 목록 
	ArrayList<Chat> chatList(PageInfo pi);

	// 채팅방 생성
	int chatInsert(Chat c);

	// 채팅 메시지 저장
	int chatMessage(ChatMessage cm);

	// 채팅방 검색 개수 
	int searchListCount(HashMap<String, String> map);
	// 채팅방 검색 목록
	ArrayList<Chat> searchChatList(HashMap<String, String> map, PageInfo pi);

	Chat selectChatInfo(int chatNo);

	// 채팅방 참여자 insert 
	int insertJoin(HashMap<String, Object> join);

	// chat_join User 정보 확인 메소드 
	int selectJoinUser(HashMap<String, Object> join);

	// chat_join 회원 데이터 삭제 
	int joinDelete(ChatJoin cj);

	// 채팅방 번호 뽑기 
	int selectChatNo();

	// 채팅방 삭제 
	int deleteChat(int chatNo);



}
