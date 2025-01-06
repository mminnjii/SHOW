package com.kh.show.chat.model.vo;

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
public class Chat {

	private int chatNo;			//	CHAT_NO	NUMBER
	private String chatTitle;	//	CHAT_TITLE	VARCHAR2(500 BYTE)
	private int showNo;			//	SHOW_NO	NUMBER
	private String userNo; 		//	USER_NO	NUMBER
	private int chatUserCount;	//	CHAT_USER_COUNT	NUMBER
	private Date createDate;	//	CREATEDATE	DATE
	private String status;		//	STATUS	VARCHAR2(1 BYTE)
	
	private int joinCount; // 참여중인 인원 tabel에는 없다.
	
	private ArrayList<Member> memList; 
	private Show show;
}
