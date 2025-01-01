package com.kh.show.payments.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.show.payments.model.service.PaymentsService;
import com.kh.show.reservation.model.service.ReservationService;
import com.kh.show.reservation.model.vo.Reservation;

@Controller
@RequestMapping("/payments") 
public class PaymentsController {

	@Autowired
	private ReservationService reservationService;
	
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
	
	
	
	
	@PostMapping(value = "/bank")
	@ResponseBody
	public String paymentComplete(HttpSession session, @RequestBody Map<String, Object> paymentData) {
		
		String[] impParts = ((String) paymentData.get("imp_uid")).split("_");
		String payId = impParts[1];
		
		String selectedName = (String) session.getAttribute("selectedName");
		String[] seatArray = selectedName.split(","); 
		
		Map<String, Object> info = new HashMap<>();
		info.put("payId", payId);
		info.put("reservationId", ((String) paymentData.get("reservationId")));
		info.put("amount", ((String) paymentData.get("amount")));
		info.put("method", 2);
		info.put("status", "N");
		info.put("methodToget", ((String) paymentData.get("methodToget")));
		
		
		// 결제 테이블 생성
		int result = paymentsService.createPay(info);
		
		String bankName = ((String) paymentData.get("vbank_name"));
		String bankNum = ((String) paymentData.get("vbank_num"));
		String name = ((String) paymentData.get("vbank_holder"));
		String dueDate = ((String) paymentData.get("vbank_date"));
		String receipt = ((String) paymentData.get("receipt"));
		
		info.put("userNo", 2);
		info.put("bankName",bankName );
		info.put("bankNum", bankNum);
		info.put("name", name);
		info.put("dueDate", dueDate);
		
		// 무통장 테이블 생성
		int result2 = paymentsService.createAccount(info);
		System.out.println("무통장 테이블 :"+result2);
		
		// 좌석별 티켓 생성
		int result3 = 0;
		Map<String, Object> ticket = new HashMap<>();
		ticket.put("reservationId", ((String) paymentData.get("reservationId")));
		ticket.put("payId", payId);
		ticket.put("roundId", ((String) paymentData.get("roundId"))); 
		
		 for(String seats : seatArray) {
			
			 // 좌석 별 티켓 생성 
			ticket.put("seats", seats);
			int seatsId = paymentsService.selectId(ticket);
			ticket.put("seatsId", seatsId);
		    int result4 = paymentsService.createTicket(ticket);
	        if (result4 == 0) {
	        	System.out.println ("좌석별 티켓 생성에 실패하였습니다. : " + seats);
	        	return "결제 실패하였습니다";
	        }
	        
	        result3 += result4;
		 }
		 
		 if(seatArray.length==result3) {
			 
			 session.setAttribute("receipt", ((String) paymentData.get("receipt")));
			 session.setAttribute("bankName", ((String) paymentData.get("vbank_name")));
			 session.setAttribute("bankNum", ((String) paymentData.get("vbank_num")));
			 session.setAttribute("dueDate", ((String) paymentData.get("vbank_date")));
			 session.setAttribute("bankHolder", ((String) paymentData.get("vbank_holder")));
			 
			 return "결제 성공하였습니다";
		 }
		
		return "결제 실패하였습니다";
	}
	
	
	@ResponseBody
	@PostMapping("/card")
	public String card(HttpSession session, @RequestBody Map<String, Object> paymentData) {
		
		String[] impParts = ((String) paymentData.get("imp_uid")).split("_");
		String payId = impParts[1];
		
		
		Map<String, Object> info = new HashMap<>();
		info.put("payId", payId);
		info.put("reservationId", ((String) paymentData.get("reservationId")));
		info.put("amount", ((String) paymentData.get("amount")));
		info.put("method", 1);
		info.put("status", "Y");
		info.put("userNo", 2);
		info.put("methodToget", ((String) paymentData.get("methodToget")));
		
		// 결제 테이블 생성
		int result = paymentsService.createPay(info);
		
		String selectedName = (String) session.getAttribute("selectedName");
		String[] seatArray = selectedName.split(",");
		
		if(result>0) {
		
			// 무통장 테이블 생성
			int result2 = paymentsService.createCard(info);
			System.out.println("무통장 테이블 :"+result2);	
			
			// 좌석별 티켓 생성
			int result3 = 0;
			Map<String, Object> ticket = new HashMap<>();
			ticket.put("reservationId", ((String) paymentData.get("reservationId")));
			ticket.put("payId", payId);
			ticket.put("roundId", ((String) paymentData.get("roundId"))); 
			
			 for(String seats : seatArray) {
				  
				 // 좌석 별 티켓 생성 
					ticket.put("seats", seats);
					int seatsId = paymentsService.selectId(ticket);
					ticket.put("seatsId", seatsId);
				    int result4 = paymentsService.createTicket(ticket);
			        if (result4 == 0) {
			        	System.out.println ("좌석별 티켓 생성에 실패하였습니다. : " + seats);
			        }
			        
			        result3 += result4;
				 }
			 
			 if(seatArray.length==result3) {
				 
				 session.setAttribute("receipt", ((String) paymentData.get("receipt")));
				 System.out.println("티켓 생성 성공..");
				 return "티켓 생성 성공..";
			 }
		
			}else {
				System.out.println("결제 생성 실패..");
				return "결제 생성 실패..";
			}
			
		
		
		return null;
	}
	
	
	@ResponseBody
	@PostMapping("/fail")
	public String paymentFail(HttpSession session, @RequestParam int reservationId, @RequestParam int roundId) {
		
		Map<String, Object> data = new HashMap<>();
		data.put("reservationId", reservationId);
		
		 // 예약테이블 삭제  
		int resultReser = paymentsService.deleteReservation(data);
		
		if (resultReser>0) {
			
			//  좌석상태 Y설정
			String selectedName = (String) session.getAttribute("selectedName");
			String[] seatArray = selectedName.split(",");
			int result = 0;
			data.put("roundId", roundId);
			
			for(String seats : seatArray) {
				data.put("seats", seats);
				 int result2 = paymentsService.rollbackSeats(data);
		        
				 if (result2 == 0) {
		        	System.out.println ("좌석별 티켓 생성에 실패하였습니다. : " + seats);
		        	return "결제 실패하였습니다";
		        }
		        
				 result += result2;
			 }
			
			if(seatArray.length==result) {
				System.out.println("좌석 rollback 성공입니다..");
				
			}
		}else {
			System.out.println("예약테이블 삭제 실패!!");
		}
		
		return "메인페이지로 돌아갑니다.";
	} 
	
	
	@PostMapping("/paymentInfo")
	public String pamentInfo(HttpSession session, @RequestParam("paymentId") String paymentId, @RequestParam("type") String type,
							Model model) {
		
		System.out.println(type);
		
		String[] impParts = paymentId.split("_");
		String payId = impParts[1];
		
		String receipt = (String) session.getAttribute("receipt");
		model.addAttribute("payId",payId);
		model.addAttribute("receipt",receipt);
		
		if(type.equals("bank")) {
			
			String bankName = (String) session.getAttribute("bankName");
			String bankNum = (String) session.getAttribute("bankNum");
			String dueDate = (String) session.getAttribute("dueDate");
			String bankHolder = (String) session.getAttribute("bankHolder");
			
			model.addAttribute("bankName",bankName);
			model.addAttribute("bankNum",bankNum);
			model.addAttribute("dueDate",dueDate);
			model.addAttribute("bankHolder",bankHolder);
		}else {
		    session.removeAttribute("bankName");
		    session.removeAttribute("bankNum");
		    session.removeAttribute("dueDate");
		    session.removeAttribute("bankHolder");
		}
		
		return "payments/paymentInfo";
	}
	
}
