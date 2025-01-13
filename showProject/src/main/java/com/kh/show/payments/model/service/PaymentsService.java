package com.kh.show.payments.model.service;

import java.util.List;

import com.kh.show.payments.model.vo.Account;
import com.kh.show.payments.model.vo.Payments;
import com.kh.show.reservation.model.vo.Seats;
import com.kh.show.reservation.model.vo.Ticket;


public interface PaymentsService {

	int createPay(Payments p);

	int createTicket(Ticket t);
	
	List<Seats> selectId(Ticket t);
	
	int createAccount(Account ac);

	int rollbackSeats(Seats s);

	int deleteReservation(int reservationId);

	int createCard(Payments p);


}
