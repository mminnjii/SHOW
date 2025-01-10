package com.kh.show.meeting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.show.common.template.PageInfo;
import com.kh.show.meeting.model.vo.Meeting;
import com.kh.show.meeting.model.vo.MeetingJoin;
import com.kh.show.showInfo.model.vo.Genre;
import com.kh.show.showInfo.model.vo.Show;

public interface MeetingService {

	// 소모임 목록
	ArrayList<Meeting> meetingList(PageInfo pi);

	// 소모임 목록 개수 
	int listCount();

	// 카테고리 리스트
	ArrayList<Genre> selectGenre();

	// 공연 목록 리스트 
	ArrayList<Show> selMeetingShow(int genreNo);

	// 소모임 생성 메소드
	int meetingInsert(Meeting m);

	// 소모임 상세 내용 
	Meeting meetingDetail(int mno);

	// 소모임 참여 메소드
	int meetingJoin(MeetingJoin mj);

	// 소모임 참여 인원 count
	int meetingCount(String mno);

	// 소모임 참여 취소 
	int joinCancle(MeetingJoin mj);

	// 회원 참여 이력 확인 
	boolean searchJoinUser(MeetingJoin mj);

	// 검색 내역
	ArrayList<Meeting> searchMeetingList(PageInfo pi, HashMap<String, Object> map);

	// 검색 목록 개수
	int searchCount(HashMap<String, Object> hashmap);

	// 공연 검색 목록 
	ArrayList<Show> selSearchShow(HashMap<String, Object> map);

	//<!-- 소모임 번호 가져오기 -->
	int selectMeetingNo();

	// 모집 기간이 지난 경우 status N으로 바꾸는 메소드 
	int updateStatus(int meetingNo);

	// 소모임 삭제 메소드
	int deleteMeeting(int meetingNo);

}
