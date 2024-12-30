package com.kh.show.payments.model.service;

import java.util.Map;

public interface PaymentsService {

	int createPay(Map<String, Object> info);

	int createTicket(Map<String, Object> ticket);

	int selectId(Map<String, Object> ticket);


}
