package com.kh.show.chat.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.show.member.model.vo.Member;

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
	
	ArrayList<Member> memList; 
}
