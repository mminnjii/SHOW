package com.kh.show.showInfo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hall {
	
	private int hallNo;//	HALL_NO	NUMBER
	private int showNo;//	SHOW_NO	NUMBER
	private String hallName;//	HALL_NAME	VARCHAR2(1000 BYTE)
	private String hallTel;//	HALL_TEL	VARCHAR2(1000 BYTE)
	private String totalSeat;//	TOTAL_SEAT	VARCHAR2(100 BYTE)
	private String hallUrl;//	HALL_URL	VARCHAR2(1000 BYTE)
	private String address;//	ADDRESS	VARCHAR2(1000 BYTE)

}
