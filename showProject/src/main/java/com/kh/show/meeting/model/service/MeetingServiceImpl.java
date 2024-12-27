package com.kh.show.meeting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.common.template.PageInfo;
import com.kh.show.meeting.model.dao.MeetingDao;
import com.kh.show.meeting.model.vo.Meeting;

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

}
