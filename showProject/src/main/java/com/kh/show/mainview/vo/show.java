package com.kh.show.mainview.vo;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class show {
	
	 private int showNo;//	SHOW_NO	NUMBER
	 private String showName;//	SHOW_NAME	VARCHAR2(1000 BYTE)
	 private String showExplain;//	SHOW_EXPLAIN	VARCHAR2(2000 BYTE)
	 private String price;//	PRICE	VARCHAR2(1000 BYTE)
	 private String notice;//	NOTICE	VARCHAR2(2000 BYTE)
	 private String precaution;//	PRECAUTION	VARCHAR2(2000 BYTE)
	 private String status;//	STATUS	VARCHAR2(1 BYTE)
	 private int hallNo;//	HALL_NO	VARCHAR2(100 BYTE)
	 private int genreNo;//	GENRE_NO	NUMBER
	 private int regionNo;//	REGION_NO	NUMBER

}
