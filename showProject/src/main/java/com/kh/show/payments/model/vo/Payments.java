package com.kh.show.payments.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.show.reservation.model.vo.Reservation;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payments {
	private String paymentId;	//	PAYMENT_ID
	private String reservationId;	//	RESERVATION_ID
	private String price;	//	PRICE
	private String paymentMethod;	//	PAYMENT_METHOD
	private Date paymentDate;	//	PAYMENT_DATE
	private String status;	//	STATUS
	private String method;	//	METHOD
	
	private String receipt;	

	
	private Creditcard c;
	
	private ArrayList<Reservation> r;
}
