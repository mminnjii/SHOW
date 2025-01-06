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
public class Profile {
	private int profileNo; //	PROFILE_NO	NUMBER
	private int userNo;//	USER_NO	NUMBER
	private String originName; //	ORIGIN_NAME	VARCHAR2(300 BYTE)
	private String changeName;//	CHANGE_NAME	VARCHAR2(300 BYTE)
	private String profilePath;//	PROFILE_PATH	VARCHAR2(1000 BYTE)
	private String status; //	STATUS	VARCHAR2(1 BYTE)
}
