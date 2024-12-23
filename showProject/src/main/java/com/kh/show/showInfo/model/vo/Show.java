package com.kh.show.showInfo.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Show {
	
	
	private int showNo;//	SHOW_NO	NUMBER
	private String showName;//	SHOW_NAME	VARCHAR2(1000 BYTE)
	private String showExplain;//	SHOW_EXPLAIN	VARCHAR2(2000 BYTE)
	private String price;//	PRICE	VARCHAR2(1000 BYTE)
	private String notice;//	NOTICE	VARCHAR2(2000 BYTE)
	private String precaution;//	PRECAUTION	VARCHAR2(2000 BYTE)
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	private String hallNo;//	HALL_NO	NUMBER
	private String genreNo;//	GENRE_NO	NUMBER
	private String regionNo;//	REGION_NO	NUMBER
	private Date showStart;//    "SHOW_START" DATE,
	private Date showEnd;//    "SHOW_END" DATE
	private int count;

}
