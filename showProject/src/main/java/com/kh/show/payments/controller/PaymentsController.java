package com.kh.show.payments.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payments") 
public class PaymentsController {

	
	
	@GetMapping("/pay")
	public String paymentsController() {
		
		
		return "payments/payment";
	}
	
	
	
	
	
	
}
