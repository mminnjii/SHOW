package com.kh.show.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ChatMessage;
import com.kh.show.common.template.PageInfo;

@Repository
public class ChatDao {

	// 채팅방 목록 개수 
	public int listCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chatMapper.listCount");
	}

	// 채팅방 목록 
	public ArrayList<Chat> chatList(SqlSessionTemplate sqlSession, PageInfo pi) {
	
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("chatMapper.chatList", null, rowBounds);
	}

	// 채팅방 생성 
	public int chatInsert(SqlSessionTemplate sqlSession, Chat c) {
		return sqlSession.insert("chatMapper.chatInsert", c);
	}

	// 채팅 메시지 저장
	public int chatMessage(SqlSessionTemplate sqlSession, ChatMessage cm) {
		return sqlSession.insert("chatMapper.chatMessage", cm); 
	}

	// 채팅방 검색 개수
	public int searchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("chatMapper.searchListCount", map);
	}
	// 채팅방 검색 목록
	public ArrayList<Chat> searchChatList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("chatMapper.searchChatList", map, rowBounds); 
	}

	// 채팅방 상세 정보 
	public Chat selectChatInfo(SqlSessionTemplate sqlSession, int chatNo) {
		System.out.println("dao : "+chatNo);
		return sqlSession.selectOne("chatMapper.selectChatInfo", chatNo);
	}

	
	
}
