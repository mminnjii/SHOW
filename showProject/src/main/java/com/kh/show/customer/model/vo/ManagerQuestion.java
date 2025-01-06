package com.kh.show.customer.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ManagerQuestion {
	private int questionNo; 		//QUESTION_NO	NUMBER
	private int userNo; 			//USER_NO	NUMBER
	private String reservationId; 		//RESERVATION_ID	NUMBER
	private int qcategoryNo; 		//QCATEGORY_NO	NUMBER
	private String quTitle; 			//Q_TITLE	VARCHAR2(500 BYTE)
	private Date createDate; 		//CREATEDATE	DATE
}
