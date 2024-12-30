package com.kh.show.meeting.model.service;

import java.util.ArrayList;

import com.kh.show.common.template.PageInfo;
import com.kh.show.meeting.model.vo.Meeting;
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

}
