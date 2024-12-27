package com.kh.show.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OpenNotice {
	
	private int openNo; 			//OPEN_NO	NUMBER
	private String openName;		//OPEN_NAME	VARCHAR2(100 BYTE)
	private String openExplain; 	//OPEN_EXPLAIN	VARCHAR2(100 BYTE)
	private int genreNo;			//GENRE_NO	NUMBER
	private int regionNo;			//REGION_NO	NUMBER
	private int hallNo; 			//HALL_NO	NUMBER
	private String openPrice;		//OPEN_PRICE	VARCHAR2(100 BYTE)

}
