package com.kh.show.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.chat.model.dao.ChatDao;
import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ChatMessage;
import com.kh.show.common.template.PageInfo;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 채팅방 목록 개수 
	@Override
	public int listCount() {
		return chatDao.listCount(sqlSession);
	}
	
	// 채팅방 목록 
	@Override
	public ArrayList<Chat> chatList(PageInfo pi) {
		return chatDao.chatList(sqlSession, pi);
	}

	// 채팅방 생성
	@Override
	public int chatInsert(Chat c) {
		return chatDao.chatInsert(sqlSession, c);
	}

	// 채팅 메시지 저장
	@Override
	public int chatMessage(ChatMessage cm) {
		return chatDao.chatMessage(sqlSession, cm);
	}

	// 채팅방 검색 개수 
	@Override
	public int searchListCount(HashMap<String, String> map) {
		return chatDao.searchListCount(sqlSession, map);
	}
	// 채팅방 검색 목록
	@Override
	public ArrayList<Chat> searchChatList(HashMap<String, String> map, PageInfo pi) {
		return chatDao.searchChatList(sqlSession, map, pi);
	}

	// 채팅방 상세 정보 
	@Override
	public Chat selectChatInfo(int chatNo) {
		return chatDao.selectChatInfo(sqlSession, chatNo);
	}

	

}
