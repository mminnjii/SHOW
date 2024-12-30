package com.kh.show.payments.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.show.payments.model.service.ImportTokenService;
import com.kh.show.reservation.model.service.ReservationService;
import com.kh.show.reservation.model.vo.Reservation;

@Controller
@RequestMapping("/payments") 
public class PaymentsController {

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private ImportTokenService importService;
	
	@PostMapping("/pay")
	public String paymentsController(HttpSession session,
									 @RequestParam("reservationId") String reservationId, Model model) {
		
		
		// System.out.println(reservationId);
		
		// 결제 전 예약정보 확인
		Reservation rInfo = reservationService.confirmReservation(reservationId);
		// System.out.println(rInfo);
		model.addAttribute("rInfo",rInfo);
		
		int num = (int) session.getAttribute("num");
		String selectedName = (String) session.getAttribute("selectedName");
		
		// System.out.println(num);
		// System.out.println(selectedName);
		
		String[] seatArray = selectedName.split(","); 
		
		double totalPrice = 0;
		double sPrice = 55000;
		String gradeName = "";
		
		 for(String name : seatArray) {
			 
			 if(name.contains("A")||name.contains("B")) {
				 totalPrice += sPrice*1.4;
				 gradeName = "VIP석";
			 }else if(name.contains("C")||name.contains("D")||name.contains("E")||name.contains("F")){
				 totalPrice += sPrice*1.2;
				 gradeName = "R석";
			 }else{
				 totalPrice += sPrice;
				 gradeName = "S석";
			 }
		 }
		 
		 model.addAttribute("totalPrice",totalPrice);
		 model.addAttribute("gradeName",gradeName);
		
		return "payments/payment";
	}
	
	
	
	
	@PostMapping("/paymentComplete")
	public String paymentComplete(String imp_uid, String merchant_uid) {
		
		// System.out.println(imp_uid);
		// System.out.println(merchant_uid);
		
		 String getToken = importService.getToken();
		 
		 System.out.println("토큰: "+getToken);
		 
		
	     String paymentDetails = importService.getPaymentDetails(getToken, merchant_uid);
		 
	     System.out.println("결제 정보: " + paymentDetails);
		
		
		return null;
	}
	
	
	
	
	
	
	
	
	
}
