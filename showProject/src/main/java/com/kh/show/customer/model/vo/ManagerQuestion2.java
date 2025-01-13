package com.kh.show.customer.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ManagerQuestion2 {
	private int questionNo; 		//QUESTION_NO	NUMBER
	private int userNo;
	private String userId; 			//USER_NO	NUMBER
	private String reservationId; 		//RESERVATION_ID	NUMBER
	private int qcategoryNo;
	private String qcategoryName; 		//QCATEGORY_NO	NUMBER
	private String quTitle; 			//Q_TITLE	VARCHAR2(500 BYTE)
	private String quContent;
	private String changeName;
	private Date createDate; 		//CREATEDATE	DATE
	private String answerContent;
}