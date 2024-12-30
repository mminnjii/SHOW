package com.kh.show.payments.controller;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.show.payments.model.service.ImportTokenService;
import com.kh.show.payments.model.service.PaymentsService;
import com.kh.show.reservation.model.service.ReservationService;
import com.kh.show.reservation.model.vo.Reservation;

@Controller
@RequestMapping("/payments") 
public class PaymentsController {

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private ImportTokenService importService;
	
	@Autowired
	private PaymentsService paymentsService;
	
	@PostMapping("/pay")
	public String paymentsController(HttpSession session,
									 @RequestParam("reservationId") String reservationId, Model model) {
		
		
		// 결제 전 예약정보 확인
		Reservation rInfo = reservationService.confirmReservation(reservationId);
		model.addAttribute("rInfo",rInfo);
		
		int num = (int) session.getAttribute("num");
		String selectedName = (String) session.getAttribute("selectedName");
		
		String[] seatArray = selectedName.split(","); 
		
		double totalPrice = 0;
		double sPrice = 55000;
		String gradeName = "";
		
		 for(String name : seatArray) {
			 
			 if(name.contains("A")||name.contains("B")) {
				 totalPrice +=sPrice*1.4;
				 gradeName = "VIP석";
			 }else if(name.contains("C")||name.contains("D")||name.contains("E")||name.contains("F")){
				 totalPrice +=sPrice*1.2;
				 gradeName = "R석";
			 }else{
				 totalPrice +=sPrice;
				 gradeName = "S석";
			 }
		 }
		 
		 NumberFormat formatter = NumberFormat.getNumberInstance(Locale.US);
		 model.addAttribute("totalPrice",formatter.format(totalPrice));
		 model.addAttribute("gradeName",gradeName);
		
		return "payments/payment";
	}
	
	
	
	
	@PostMapping("/bank")
	public String paymentComplete(HttpSession session,String imp_uid, String merchant_uid, 
								  String reservationId, String amount, int method, int roundId) {
		
		String[] impParts = imp_uid.split("_");
		String payId = impParts[1];
		
		String selectedName = (String) session.getAttribute("selectedName");
		String[] seatArray = selectedName.split(","); 
		
		
		Map<String, Object> info = new HashMap<>();
		info.put("payId", payId);
		info.put("reservationId", reservationId);
		info.put("amount", amount);
		info.put("method", method);
		info.put("status", "N");
		
		// 결제 테이블 생성
		int result = paymentsService.createPay(info);
		
		// 좌석별 티켓 생성
//		TICKET_ID
//		RESERVATION_ID
//		SEAT_ID
//		PAYMENT_ID
//		STATUS
		int result2 = 0;
		Map<String, Object> ticket = new HashMap<>();
		ticket.put("reservationId", reservationId);
		ticket.put("payId", payId);
		ticket.put("roundId", roundId); // roundId 여야한다.
		
		System.out.println(roundId);
		
		 for(String name : seatArray) {
			 // 좌석 별 티켓 생성 
			ticket.put("name", name);
			int seatsId = paymentsService.selectId(ticket);
			ticket.put("seatsId", seatsId);
		    int result3 = paymentsService.createTicket(ticket);
	        if (result3 == 0) {
	        	System.out.println ("좌석 상태 변환에 실패하였습니다. : " + name);
	        }
	        result2 += result3;
			 
		 }
		
		 if(seatArray.length==result2) {
			 session.setAttribute("selectedName", selectedName);
			 return null;
		 }
		 
		
//		 String getToken = importService.getToken();
//		 System.out.println("토큰: "+getToken);
//		 
//		
//	     String paymentDetails = importService.getPaymentDetails(getToken,imp_uid ,merchant_uid);
//	     System.out.println("결제 정보: " + paymentDetails);
		
		
		return null;
	}
	
	
	
	@PostMapping("/card")
	public String card(HttpSession session,String imp_uid, String merchant_uid, 
			  			String reservationId, String amount, int method) {
		
		String[] impParts = imp_uid.split("_");
		String payId = impParts[1];
		
		
		Map<String, Object> info = new HashMap<>();
		info.put("payId", payId);
		info.put("reservationId", reservationId);
		info.put("amount", amount);
		info.put("method", method);
		info.put("status", "Y");
		
		// 결제 테이블 생성
		int result = paymentsService.createPay(info);
		
		String selectedName = (String) session.getAttribute("selectedName");
		String[] seatArray = selectedName.split(",");
		
		if(result>0) {
			
			 for(String name : seatArray) {
				  // 티켓 생성
				 
				 System.out.println(name);
			 }
			
		}
	
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
}
