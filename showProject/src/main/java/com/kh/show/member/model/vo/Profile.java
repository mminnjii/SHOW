package com.kh.show.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Profile {
	public int profileNo;//	PROFILE_NO	NUMBER
	public int userNO;//	USER_NO	NUMBER
	public String originName;//	ORIGIN_NAME	VARCHAR2(300 BYTE)
	public String changeName;//	CHANGE_NAME	VARCHAR2(300 BYTE)
	public String profilePath;//	PROFILE_PATH	VARCHAR2(1000 BYTE)
	public String status;//	STATUS	VARCHAR2(1 BYTE)
}
