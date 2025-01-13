package com.kh.show.meeting.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ManagerMeeting {
	private int meetingNo;
	private int userNo;
	private String userId;
	private String meetingTitle;
	private int showNo;
	private String showName;
	private String meetingPlace;
	private int meetingCount;
	private Date meetingDate;
	private Date startDate;
	private Date endDate;
	private String information;
}
