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
public class Payments {
	private int paymentId;	//	PAYMENT_ID
	private int reservationId;	//	RESERVATION_ID
	private int price;	//	PRICE
	private int paymentMethod;	//	PAYMENT_METHOD
	private Date paymentDate;	//	PAYMENT_DATE
	private String status;	//	STATUS
	private int method;	//	METHOD
}
