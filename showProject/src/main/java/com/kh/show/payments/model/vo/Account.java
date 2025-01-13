package com.kh.show.payments.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Account {
	private String paymentId; //	PAYMENT_ID
	private int userNo; //	USER_NO
	private String bankName;//	BANK_NAME
	private String bankNum;//	BANK_NUM
	private String name; //	NAME
	private String dueDate;//	DUE_DATE
	
	// 환불을 위한 사용
	private String reason;
	private String amount;
	private String refund_holder;
	private String refund_bank;
	private String refund_account;
	private String reservationId;
	
}
