package com.kh.show.customer.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Question {
	
	private int questionNo; 		//QUESTION_NO	NUMBER
	private int userNo; 			//USER_NO	NUMBER
	private String reservationId; 		//RESERVATION_ID	NUMBER
	private int qcategoryNo; 		//QCATEGORY_NO	NUMBER
	private String quTitle; 			//Q_TITLE	VARCHAR2(500 BYTE)
	private String quContent; 		//Q_CONTENT	VARCHAR2(2000 BYTE)
	private String originName; 		//ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String changeName; 		//CHANGE_NAME	VARCHAR2(1 BYTE)
	private Date createDate; 		//CREATEDATE	DATE
	private String status;			//STATUS	VARCHAR2(1 BYTE)
	private String answerContent; 	//ANSWER_CONTENT	VARCHAR2(3000 BYTE)
	
	private String name; //"NAME" VARCHAR(100) 
	private String email; //"EMAIL" VARCHAR(100)
	private String phone; //"PHONE" VARCHAR(100)
	
	
}
