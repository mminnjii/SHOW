package com.kh.show.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ManagerChat {
	private int chatNo;			//	CHAT_NO	NUMBER
	private String chatTitle;	//	CHAT_TITLE	VARCHAR2(500 BYTE)
	private int showNo;			//	SHOW_NO	NUMBER
	private String showTitle;
	private String userNo; 		//	USER_NO	NUMBER
	private String userId;
	private int chatUserCount;	//	CHAT_USER_COUNT	NUMBER
	private Date createDate;	//	CREATEDATE	DATE
	private String status;		//	STATUS	VARCHAR2(1 BYTE)
}
