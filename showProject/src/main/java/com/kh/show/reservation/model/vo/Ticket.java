package com.kh.show.reservation.model.vo;

import java.sql.Date;

import com.kh.show.payments.model.vo.Payments;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Ticket {
	private int ticketId;	//	TICKET_ID
	private int reservationId;	//	RESERVATION_ID
	private int seatId;	//	SEAT_ID
	private int paymentId;	//	PAYMENT_ID
	private String status;	//	STATUS
}
