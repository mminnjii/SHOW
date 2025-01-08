package com.kh.show.member.model.vo;


import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JoinMeeting {
	private int meetingNo;
	private String meetingTitle;	
	private int userNo;
	private String userId;
	private int showNo;
	private String meetingPlace;
	private String showName;
	private int meetingCount;
	private Date meetingDate;//	MEETING_DATE
	private Date startDate;//	START_DATE
	private Date endDate;//	END_DATE
	private int joinCount;
	private String status;
}
