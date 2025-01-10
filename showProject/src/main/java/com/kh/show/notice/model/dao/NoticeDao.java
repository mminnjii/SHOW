package com.kh.show.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.common.template.PageInfo;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.notice.model.vo.OpenNotice;
import com.kh.show.showInfo.model.vo.Show;

@Repository
public class NoticeDao {

	// 리스트 개수 
	public int listCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.listCount");
	}

	// 리스트 목록 조회 메소드 
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		// 페이징 처리를 위한 rowbounds 준비 
		
		// 1. 몇 개씩 조회할 것인지 (한 페이지에 보여지는 페이징바 최대 개수)
		int limit = pi.getBoardLimit();
		// 2. 몇 번째 부터 조회할 것인지 (현재페이지-1)*페이징바 최대 개수
		int offset = (pi.getCurrentPage()-1)*limit;
		
		/* 
		 * 0~9 / 10      0 + *10  == 0+1 = 1
		 * 10~19 / 10 == 1 + *10  == 10+1 == 11
		 */
		
		// RowBounds : 마이바티스 - 특정 개수만큼의 레코드 건너띄게 함. offset, limit 생성자 사용.
		// offset : 몇 개의 게시글을 건너뛰고 조회할 건지에 대한 값
		// limit : boardLimit (한 페이지에 보여질 게시글의 최대 개수)
		RowBounds rowBounds = new RowBounds(offset, limit);
				   
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	// 검색 목록 개수
	public int searchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.selectOne("noticeMapper.searchCount", map);
	}

	// 검색 목록 정보 메소드 
	public ArrayList<Notice> searchNotice(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.searchNotice", map, rowBounds);
	}

	// 오픈공지 검색 목록 개수
	public int searchOpenCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("noticeMapper.searchOpenCount", map);
	}

	// 오픈공지 검색 목록 정보 메소드 
	public ArrayList<OpenNotice> searchOpenNotice(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.searchOpenNotice", map, rowBounds);
	}
	
	// 공지사항 상세보기 
	public Notice noticeDetail(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.selectOne("noticeMapper.noticeDetail", nno);
	}

	// 공지사항 조회수 up 
	public int noticeUpCount(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.noticeUpCount", nno);
	}

	// 오픈공지 개수 
	public int openlistCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.openlistCount");
	}

	// 오픈공지 목록 
	public ArrayList<OpenNotice> selectOpenList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// 페이징 처리를 위한 rowbounds 준비 
		
		// 1. 몇 개씩 조회할 것인지 (한 페이지에 보여지는 페이징바 최대 개수)
		int limit = pi.getBoardLimit();
		// 2. 몇 번째 부터 조회할 것인지 (현재페이지-1)*페이징바 최대 개수
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
				   
		return (ArrayList)sqlSession.selectList("noticeMapper.selectOpenList", null, rowBounds);
		
	}

	public OpenNotice openSelect(SqlSessionTemplate sqlSession, String showName) {
		
		return sqlSession.selectOne("noticeMapper.openSelect",showName);
	}

	public int opennoticeUpCount(SqlSessionTemplate sqlSession, int openNo) {
		return sqlSession.update("noticeMapper.opennoticeUpCount", openNo);
	}

	// 오픈공지 상세정보 
	public Show openNoticeSelect(SqlSessionTemplate sqlSession, int openNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("showInfoMapper.openNoticeSelect", openNo);
	}

	

}
