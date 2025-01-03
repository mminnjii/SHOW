package com.kh.show.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.chat.model.dao.ChatDao;
import com.kh.show.chat.model.vo.Chat;
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


}
