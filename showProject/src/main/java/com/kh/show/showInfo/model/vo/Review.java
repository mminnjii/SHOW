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
public class Review {
	private int reviewId; //	REVIEW_ID
	private int showNo;  //	SHOW_NO
	private int userId;	//	USER_NO
	private int reviewRank;	//	REVIEW_RANK
	private String reviewTitle;	//	REVIEW_TITLE
	private String reviewContent;	//	REVIEW_CONTENT
	private int count;	//	COUNT
	private Date createDate;	//	CREATE_DATE
	private String status;	//	STATUS
}
