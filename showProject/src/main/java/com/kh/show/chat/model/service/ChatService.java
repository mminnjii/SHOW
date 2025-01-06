package com.kh.show.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.show.chat.model.vo.Chat;
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


}
