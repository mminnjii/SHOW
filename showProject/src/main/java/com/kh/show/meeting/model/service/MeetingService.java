package com.kh.show.meeting.model.service;

import java.util.ArrayList;

import com.kh.show.common.template.PageInfo;
import com.kh.show.meeting.model.vo.Meeting;

public interface MeetingService {

	// 소모임 목록
	ArrayList<Meeting> meetingList(PageInfo pi);

	// 소모임 목록 개수 
	int listCount();

}
