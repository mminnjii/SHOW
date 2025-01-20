package com.kh.show.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ChatJoin;
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
	
	// 참여자 insert
	public int insertJoin(SqlSessionTemplate sqlSession, HashMap<String, Object> join) {
		return sqlSession.insert("chatMapper.insertJoin", join);
	}

	// chat_join User 정보 확인 메소드 
	public int selectJoinUser(SqlSessionTemplate sqlSession, HashMap<String, Object> join) {
		return sqlSession.selectOne("chatMapper.selectJoinUser", join);
	}

	// chat_join 회원 데이터 삭제
	public int joinDelete(SqlSessionTemplate sqlSession, ChatJoin cj) {
		return sqlSession.delete("chatMapper.joinDelete", cj);
	}

	// 채팅방 번호 뽑기 
	public int selectChatNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chatMapper.selectChatNo");
	}

	// 채팅방에 join되어 있는 회원인지 확인하는 메소드
	public ChatJoin joinUser(SqlSessionTemplate sqlSession, ChatJoin cj) {
		return sqlSession.selectOne("chatMapper.joinUser", cj);
	}

	// 채팅방 메시지 담은 List
	public ArrayList<ChatMessage> selectChatList(SqlSessionTemplate sqlSession, int chatNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList", chatNo);
	}

	// 채팅방 삭제 
	public int deleteChat(SqlSessionTemplate sqlSession, int chatNo) {
		return sqlSession.update("chatMapper.deleteChat", chatNo);
	}

	// 채팅 내역 삭제 
	public int delcteChatContent(SqlSessionTemplate sqlSession, int chatNo) {
		return sqlSession.delete("chatMapper.delcteChatContent", chatNo);
	}

	// chat_join 회원 데이터 삭제
	public int joinDeleteAll(SqlSessionTemplate sqlSession, int chatNo) {
		return sqlSession.delete("chatMapper.joinDeleteAll", chatNo);
	}


	
	
}
