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
public class MeetingJoin {
	private int meetingNo;		//MEETING_NO number
	private int userNo;			//USER_NO number
}
