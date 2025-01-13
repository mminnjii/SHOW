package com.kh.show.customer.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ManagerQuestion2 {
	private int questionNo; 		//QUESTION_NO	NUMBER
	private int userNo;
	private String userName; 			//USER_NO	NUMBER
	private String reservationId; 		//RESERVATION_ID	NUMBER
	private String qcategoryName; 		//QCATEGORY_NO	NUMBER
	private String quTitle; 			//Q_TITLE	VARCHAR2(500 BYTE)
	private String quContent;
	private Date createDate; 		//CREATEDATE	DATE
	private String answerContent;
}