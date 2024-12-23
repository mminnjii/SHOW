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
public class ShowRound {
	
	private int roundId;	//	ROUND_ID
	private int showNo;	//	SHOW_NO
	private int showRound;	//	SHOW_ROUND
	private String showTime;	//	SHOW_TIME
	private Date showDate;	//	SHOW_DATE
	private Date showStart;	//	SHOW_START
	private Date showEnd;	//	SHOW_END
}
