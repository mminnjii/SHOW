package com.kh.show.payments.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Account {
	private int paymentId; //	PAYMENT_ID
	private int userNo; //	USER_NO
	private String bankName;//	BANK_NAME
	private String bankNum;//	BANK_NUM
	private String name; //	NAME
	private String dueDate;//	DUE_DATE
}
