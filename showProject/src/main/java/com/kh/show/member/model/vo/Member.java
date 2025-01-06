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
public class Member {
	private int userNo;//	USER_NO	NUMBER
	private String userId;//	USER_ID	VARCHAR2(30 BYTE)
	private String userPwd;//	USER_PWD	VARCHAR2(100 BYTE)
	private String userName;//	USER_NAME	VARCHAR2(15 BYTE)
	private String userRrn;//	USER_RRN	CHAR(14 BYTE)
	private String phone;//	PHONE	VARCHAR2(13 BYTE)
	private String email;//	EMAIL	VARCHAR2(100 BYTE)
	private String address;//	ADDRESS	VARCHAR2(100 BYTE)
	private Date enrollDate;//	ENROLL_DATE	DATE
	private Date modifyDate;//	MODIFY_DATE	DATE
	private String originName;//	ORIGIN_NAME	VARCHAR2(300 BYTE)
	private String changeName;//	CHANGE_NAME	VARCHAR2(300 BYTE)
	private String rank;//	RANK	VARCHAR2(5 BYTE)
	private String subscribe;//	SUBSCRIBE	VARCHAR2(1 BYTE)
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	// Profile
	// collection 사용하기 위해 작성 - 전수민
	private Profile profile;

	private int point;
}
