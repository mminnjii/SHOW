package com.kh.show.meeting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.common.template.PageInfo;
import com.kh.show.meeting.model.dao.MeetingDao;
import com.kh.show.meeting.model.vo.Meeting;
import com.kh.show.meeting.model.vo.MeetingJoin;
import com.kh.show.showInfo.model.vo.Genre;
import com.kh.show.showInfo.model.vo.Show;

@Service
public class MeetingServiceImpl implements MeetingService {

	@Autowired
	private MeetingDao meetingdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 소모임 목록
	@Override
	public ArrayList<Meeting> meetingList(PageInfo pi) {
		return meetingdao.meetingList(sqlSession, pi);
	}

	// 소모임 목록 개수 
	@Override
	public int listCount() {
		return meetingdao.listCount(sqlSession);
	}

	// 카테고리 목록
	@Override
	public ArrayList<Genre> selectGenre() {
		return meetingdao.selectGenre(sqlSession);
	}

	// 공연 목록 리스트 
	@Override
	public ArrayList<Show> selMeetingShow(int genreNo) {
		return meetingdao.selMeetingShow(sqlSession, genreNo);
	}

	// 소모임 생성 메소드 
	@Override
	public int meetingInsert(Meeting m) {
		return meetingdao.meetingInsert(sqlSession, m);
	}

	// 소모임 상세 내용 
	@Override
	public Meeting meetingDetail(int mno) {
		return meetingdao.meetingDetail(sqlSession, mno);
	}

	// 소모임 참여 메소드 
	@Override
	public int meetingJoin(MeetingJoin mj) {
		return meetingdao.meetingJoin(sqlSession, mj);
	}

	// 소모임 참여 인원 count
	@Override
	public int meetingCount(String mno) {
		return meetingdao.meetingCount(sqlSession, mno);
	}

	// 소모임 참여 취소 
	@Override
	public int joinCancle(MeetingJoin mj) {
		return meetingdao.joinCancle(sqlSession, mj);
	}

	// 회원 참여 이력 확인
	@Override
	public boolean searchJoinUser(MeetingJoin mj) {
		return meetingdao.searchJoinUser(sqlSession, mj);
	}

	// 검색 목록
	@Override
	public ArrayList<Meeting> searchMeetingList(PageInfo pi, HashMap<String, Object> map) {
		return meetingdao.searchMeetingList(sqlSession, pi, map);
	}

	// 검색 목록 개수 
	@Override
	public int searchCount(HashMap<String, Object> hashmap) {
		return meetingdao.searchCount(sqlSession, hashmap);
	}

	// 공연 검색 목록 
	@Override
	public ArrayList<Show> selSearchShow(HashMap<String, Object>  map) {
		System.out.println(map);
		
		return meetingdao.selSearchShow(sqlSession, map);
	}

	//<!-- 소모임 번호 가져오기 -->
	@Override
	public int selectMeetingNo() {
		return meetingdao.selectMeetingNo(sqlSession);
	}

	// 모집 기간이 지난 경우 status N으로 바꾸는 메소드 
	@Override
	public int updateStatus(int meetingNo) {
		return meetingdao.updateStatus(sqlSession, meetingNo);
	}

	// 소모임 삭제 메소드
	@Override
	public int deleteMeeting(int meetingNo) {
		return meetingdao.deleteMeeting(sqlSession, meetingNo);
	}

}
