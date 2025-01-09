package com.kh.show.meeting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.common.template.PageInfo;
import com.kh.show.meeting.model.vo.Meeting;
import com.kh.show.meeting.model.vo.MeetingJoin;
import com.kh.show.showInfo.model.vo.Genre;
import com.kh.show.showInfo.model.vo.Show;

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
	
	// 카테고리 목록 
	public ArrayList<Genre> selectGenre(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("meetingMapper.selectGenre");
	}
	
	// 공연 목록 리스트 
	public ArrayList<Show> selMeetingShow(SqlSessionTemplate sqlSession, int genreNo) {
		return (ArrayList)sqlSession.selectList("showInfoMapper.selMeetingShow", genreNo);
	}

	// 소모임 생성 메소드 
	public int meetingInsert(SqlSessionTemplate sqlSession, Meeting m) {
		return sqlSession.insert("meetingMapper.meetingInsert", m);
	}

	// 소모임 상세 내용 
	public Meeting meetingDetail(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("meetingMapper.meetingDetail", mno);
	}

	// 소모임 참여 메소드
	public int meetingJoin(SqlSessionTemplate sqlSession, MeetingJoin mj) {
		return sqlSession.insert("meetingMapper.meetingJoin", mj);
	}

	// 소모임 참여 인원 count
	public int meetingCount(SqlSessionTemplate sqlSession, String mno) {
		return sqlSession.selectOne("meetingMapper.meetingCount", mno);
	}

	// 소모임 참여 취소 
	public int joinCancle(SqlSessionTemplate sqlSession, MeetingJoin mj) {
		return sqlSession.delete("meetingMapper.joinCancle", mj);
	}

	// 회원 참여 이력 확인 
	public boolean searchJoinUser(SqlSessionTemplate sqlSession, MeetingJoin mj) {
		return sqlSession.selectOne("meetingMapper.searchJoinUser", mj);
	}

	public ArrayList<Meeting> searchMeetingList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, Object> map) {
		
		// 1. 몇개씩 조회 
		int limit = pi.getBoardLimit();
		// 2. 몇 번째부터 조회할지 
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("meetingMapper.searchMeetingList", map, rowBounds);
	}

	// 검색 목록 개수 
	public int searchCount(SqlSessionTemplate sqlSession, HashMap<String, Object> hashmap) {
		return sqlSession.selectOne("meetingMapper.searchCount", hashmap);
	}

	// 소모임, 채팅 생성시 필요한 공연 검색 목록 
	public ArrayList<Show> selSearchShow(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		System.out.println(map);
		
		return (ArrayList)sqlSession.selectList("meetingMapper.selSearchShow", map);
	}

	//<!-- 소모임 번호 가져오기 -->
	public int selectMeetingNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meetingMapper.selectMeetingNo");
	}

	// 모집 기간이 지난 경우 status N으로 바꾸는 메소드 
	public int updateStatus(SqlSessionTemplate sqlSession, int meetingNo) {
		return sqlSession.update("meetingMapper.updateStatus", meetingNo);
	}

	// 소모임 삭제 메소드
	public int deleteMeeting(SqlSessionTemplate sqlSession, int meetingNo) {
		return sqlSession.delete("meetingMapper.deleteMeeting", meetingNo);
	}
	
	
}
