package com.kh.show.meeting.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.show.member.model.vo.Member;
import com.kh.show.showInfo.model.vo.Show;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Meeting {

	private int meetingNo; 			//MEETING_NO	NUMBER
	private String userNo;				//USER_NO	NUMBER
	private String meetingTitle; 	//MEETING_TITLE	VARCHAR2(500 BYTE)
	private String showNo;				//SHOW_NO	NUMBER
	private String meetingPlace; 	//MEETING_PLACE	VARCHAR2(100 BYTE)
	private int meetingCount;		//MEETING_COUNT	NUMBER
	private Date meetingDate; 		//MEETING_DATE	DATE
	private Date startDate; 		//START_DATE	DATE
	private Date endDate;			//END_DATE	DATE
	private String infomation;		//INFOMATION	VARCHAR2(2000 BYTE)
	private String status;			//STATUS	VARCHAR2(1 BYTE)

	private int joinNo;   // 참여중인 회원
	
	private ArrayList<Member> memList;
	
	private Show show;
}
