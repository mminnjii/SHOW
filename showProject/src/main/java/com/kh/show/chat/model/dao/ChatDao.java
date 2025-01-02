package com.kh.show.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.chat.model.vo.Chat;
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

}
