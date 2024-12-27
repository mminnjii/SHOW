package com.kh.show.meeting.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.common.template.PageInfo;
import com.kh.show.meeting.model.vo.Meeting;

@Repository
public class MeetingDao {

	// 소모임 목록
	public ArrayList<Meeting> meetingList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		// 페이징 처리 rowBounds
		
		// 1. 몇개씩 조회 
		int limit = pi.getBoardLimit();
		// 2. 몇 번째부터 조회할지 
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("meetingMapper.meetingList", null, rowBounds);
	}

	// 소모임 개수 
	public int listCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meetingMapper.listCount");
	}

}
