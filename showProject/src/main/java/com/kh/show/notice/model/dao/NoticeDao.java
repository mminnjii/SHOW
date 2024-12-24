package com.kh.show.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.common.model.vo.PageInfo;
import com.kh.show.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	// 리스트 개수 
	public int listCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.listCount");
	}

	// 리스트 목록 조회 메소드 
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		// 페이징 처리를 위한 rowbounds 준비 
		// 1. 몇 개씩 조회할 것인지 
		int limit = pi.getBoardLimit();
		// 2. 몇 번째 부터 조회할 것인지 
		int offset = (pi.getCurrentPage()-1)*limit;
		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

}
