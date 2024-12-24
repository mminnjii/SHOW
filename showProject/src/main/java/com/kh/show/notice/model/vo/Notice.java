package com.kh.show.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notice {
	
	private int noticeNo; 			// NOTICE_NO	NUMBER
	private String noticeTitle; 	// NOTICE_TITLE	VARCHAR2(500 BYTE)
	private String noticeContent; 	// NOTICE_CONTENT	VARCHAR2(4000 BYTE)
	private Date createDate; 		// CREATEDATE	DATE
	private int count;  			// COUNT	NUMBER
	private String status; 			// STATUS	VARCHAR2(1 BYTE)

}
