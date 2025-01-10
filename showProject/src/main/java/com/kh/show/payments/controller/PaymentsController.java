package com.kh.show.payments.controller;


import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.show.payments.model.service.PaymentsService;
import com.kh.show.payments.model.vo.Payments;
import com.kh.show.reservation.model.service.ReservationService;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.reservation.model.vo.Ticket;

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
		
		// 가격 조회
		double sPrice = (double)session.getAttribute("Price");
		
		String gradeName = "";
		String gradeName1 = "";
		String gradeName2 = "";
		String gradeName3= "";
		
		 for(String name : seatArray) {
			 
			 if(name.contains("A")||name.contains("B")) {
				 totalPrice +=sPrice*1.4;
				 gradeName1 = "VIP석";
			 }else if(name.contains("C")||name.contains("D")||name.contains("E")||name.contains("F")){
				 totalPrice +=sPrice*1.2;
				 gradeName2 = "R석";
			 }else{
				 totalPrice +=sPrice;
				 gradeName3 = "S석";
			 }
		 }
		 
		 gradeName += gradeName1+gradeName2+gradeName3;
		 
		 NumberFormat formatter = NumberFormat.getNumberInstance(Locale.US);
		 model.addAttribute("totalPrice",formatter.format(totalPrice));
		 model.addAttribute("gradeName",gradeName);
		
		return "payments/payment";
	}
	
	@PostMapping(value ="/processPayment",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String processPayment(int reservationId, int roundId, String selectedName) {
		System.out.println(reservationId);
		System.out.println(roundId);
		System.out.println(selectedName);
		
		return "check";
	}
	
	
	@Transactional
	@PostMapping(value = "/bank",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String bankComplete(HttpSession session ,@RequestBody Map<String, Object> paymentData) {
		
		// payment식별자와 결제번호와 연동
		String[] impParts = ((String) paymentData.get("imp_uid")).split("_");
		String payId = impParts[1];
	
		// 회원번호 추출
		Integer userNo = (Integer) session.getAttribute("userNo");
		// 좌석번호 추출
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
		
		if(result>0) {
			
			String bankName = ((String) paymentData.get("vbank_name"));
			String bankNum = ((String) paymentData.get("vbank_num"));
			String name = ((String) paymentData.get("vbank_holder"));
			String dueDate = ((String) paymentData.get("vbank_date"));
			String receipt = ((String) paymentData.get("receipt"));
			
			info.put("userNo", userNo);
			info.put("bankName",bankName );
			info.put("bankNum", bankNum);
			info.put("name", name);
			info.put("dueDate", dueDate);
			info.put("userNo", userNo);
			
			// 무통장 테이블 생성
			int result2 = paymentsService.createAccount(info);
			if(result2>0) {
				
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
					 session.setAttribute("bankName", ((String) paymentData.get("vbank_name")));
					 session.setAttribute("bankNum", ((String) paymentData.get("vbank_num")));
					 session.setAttribute("dueDate", ((String) paymentData.get("vbank_date")));
					 session.setAttribute("bankHolder", ((String) paymentData.get("vbank_holder")));
					 session.setAttribute("price", ((String) paymentData.get("amount")));
					 return "success";
				 }else {
					 return "좌석별 티켓 생성에 실패하였습니다.";
				 }
			
			}else {
				return "통장데이터가 생성되지 못했습니다.";
			}
			
		}else {
			return "결제가 생성되지 못했습니다.";
		}
	}
	
	@Transactional
	@ResponseBody
	@PostMapping(value = "/card",produces ="text/html; charset=UTF-8")
	public String cardComplete(HttpSession session, @RequestBody Map<String, Object> paymentData) {
		
		String[] impParts = ((String) paymentData.get("imp_uid")).split("_");
		String payId = impParts[1];
		
		// 회원번호 추출
		Integer userNo = (Integer) session.getAttribute("userNo");
		
		// 좌석번호 추출
		String selectedName = (String) session.getAttribute("selectedName");
		String[] seatArray = selectedName.split(",");
		
		Map<String, Object> info = new HashMap<>();
		info.put("payId", payId);
		info.put("reservationId", ((String) paymentData.get("reservationId")));
		info.put("amount", ((String) paymentData.get("amount")));
		info.put("method", 1);
		info.put("status", "Y");
		info.put("userNo", userNo);
		info.put("methodToget", ((String) paymentData.get("methodToget")));
		
		// 결제 테이블 생성
		int result = paymentsService.createPay(info);
		if(result>0) {
		
			// 카드 테이블 생성
			int result2 = paymentsService.createCard(info);
			if(result2>0) {
				
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
					 session.setAttribute("price", ((String) paymentData.get("amount")));
					 return "success";
				 }else {
					 return "카드데이터가 생성되지 못했습니다.";
				 }
			}else {
				return "결제가 생성되지 못했습니다.";
			}
		
		}else {
			return "결제가 생성되지 못했습니다.";
		}
	}
	
	@Transactional
	@ResponseBody
	@PostMapping(value = "/fail",produces ="text/html; charset=UTF-8")
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
		        	System.out.println ("좌석별 티켓 rollback에 실패하였습니다. : " + seats);
		        }
		        
				 result += result2;
			 }
			
			if(seatArray.length==result) {
				session.removeAttribute("s");
				session.removeAttribute("vipPrice");
				session.removeAttribute("rPrice");
				session.removeAttribute("sPrice");
				session.removeAttribute("Price");
				session.removeAttribute("date");
				session.removeAttribute("num");
				session.removeAttribute("selectedName");
				session.removeAttribute("userNo");
				session.removeAttribute("reviewAvg");
				session.removeAttribute("avgFloor");
				return "success";
				
			}else {
				return "좌석별 티켓 rollback에 실패하였습니다.";
			}
			
		}else {
			return "예약 rollback에 실패하였습니다.";
		}
	} 
	
	
	@PostMapping("/paymentInfo")
	public String pamentInfo(HttpSession session, Payments p, Model model) {
		
		String[] impParts = p.getPaymentId().split("_");
		String paymentId = impParts[1];
		
		String receipt = (String) session.getAttribute("receipt");
		String price = (String) session.getAttribute("price");
		
		model.addAttribute("paymentId",paymentId);
		model.addAttribute("receipt",receipt);
		model.addAttribute("price",price);
		
		String reservationId = p.getReservationId();
		
		// 예약정보 조회
		Reservation rInfo = reservationService.confirmReservation(reservationId);
		model.addAttribute("rInfo",rInfo);
		
		// 티켓정보 조회
		ArrayList <Ticket> t = reservationService.confirmTicket(reservationId);
		model.addAttribute("t",t);
		
		if(p.getMethodToget()==1) {
			model.addAttribute("methodToget","현장수령");
		}else {
			model.addAttribute("methodToget","택배수령");
		}
		
		if(p.getPaymentMethod().equals("bank")) {
			
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
