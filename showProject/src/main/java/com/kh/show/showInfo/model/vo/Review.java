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
	private String showNo;  //	SHOW_NO
	private String userId;	//	USER_NO
	private double reviewScore;	//	REVIEW_SCORE
	private String reviewTitle;	//	REVIEW_TITLE
	private String reviewContent;	//	REVIEW_CONTENT
	private Date createDate;	//	CREATE_DATE
	private String status;	//	STATUS
	

}
