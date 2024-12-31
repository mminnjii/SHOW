package com.kh.show.chat.model.service;

import java.util.ArrayList;

import com.kh.show.chat.model.vo.Chat;
import com.kh.show.common.template.PageInfo;

public interface ChatService {

	// 채팅방 목록 개수 
	int listCount();
	
	// 채팅방 목록 
	ArrayList<Chat> chatList(PageInfo pi);

}
