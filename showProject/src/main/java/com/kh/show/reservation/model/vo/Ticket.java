package com.kh.show.reservation.model.vo;




import java.util.List;

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
	private String reservationId;	//	RESERVATION_ID
	private String seatId;	//	SEAT_ID
	private String seatName;	//	SEAT_ID
	private String paymentId;	//	PAYMENT_ID
	private String roundId;	
	private String status;	//	STATUS
	
	private String[] seatArray;
	private List<Seats> seatsList;
}
