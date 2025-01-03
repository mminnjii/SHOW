package com.kh.show.payments.model.service;

import java.util.Map;

public interface PaymentsService {

	int createPay(Map<String, Object> info);

	int createTicket(Map<String, Object> ticket);
	
	int selectId(Map<String, Object> ticket);
	
	int createAccount(Map<String, Object> info);

	int rollbackSeats(Map<String, Object> data);

	int deleteReservation(Map<String, Object> data);

	int createCard(Map<String, Object> info);


}
