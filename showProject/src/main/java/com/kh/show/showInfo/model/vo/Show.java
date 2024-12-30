package com.kh.show.showInfo.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Show {
	private int showNo;					//	SHOW_NO			 NUMBER
	private String showName;			//	SHOW_NAME		 VARCHAR2(1000 BYTE)
	private String showExplain;			//	SHOW_EXPLAIN	 VARCHAR2(2000 BYTE)
	private String rPrice;				//	RPRICE			 VARCHAR2(1000 BYTE)
	private String sPrice;				//  SPRICE			 VARCHAR2(1000 BYTE)
	private String vPrice;				//	VPRICE			 VARCHAR2(1000 BYTE)
	private String Price;				//	PRICE			 VARCHAR2(1000 BYTE)
	private String notice;				//	NOTICE			 VARCHAR2(2000 BYTE)
	private String precaution;			//	PRECAUTION		 VARCHAR2(2000 BYTE)
	private String status;				//	STATUS			 VARCHAR2(1 BYTE)

	private int hallNo;					//	HALL_NO			 NUMBER
	private String hallName;			// 사용하기 위해 추가		
	private int genreNo;				//	GENRE_NO		 NUMBER
	private String genreName;				// 사용하기 위해 추가	
	private int regionNo;				//	REGION_NO		 NUMBER
	private String regionName;			// 사용하기 위해 추가	


	private String showStart;			//  SHOW_START		 DATE
	private String showEnd;				//  SHOW_END		 DATE
	private String posterOriginName;	//	POTSERORIGINNAME VARCHAR2(1000 BYTE)
	private String posterChangeName;	//	POSTERCHANGENAME VARCHAR2(1000 BYTE)
	private String detailOriginName;	//	DETAILORIGINNAME VARCHAR2(1000 BYTE)
	private String detailChangeName;	//	DETAILCHANGENAME VARCHAR2(1000 BYTE)
	private int count;					//	COUNT			 NUMBER

	
	
	//Hall VO 만들고 mapper에도 추가했음
	private Hall hall;  // 하나의 Hall 객체만 담도록 수정
}
