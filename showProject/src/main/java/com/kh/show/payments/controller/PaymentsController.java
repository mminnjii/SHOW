package com.kh.show.payments.controller;


import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.show.payments.model.service.PaymentsService;
import com.kh.show.payments.model.vo.Account;
import com.kh.show.payments.model.vo.Creditcard;
import com.kh.show.payments.model.vo.Payments;
import com.kh.show.reservation.model.service.ReservationService;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.reservation.model.vo.Seats;
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
		System.out.println("selectedName: "+selectedName);
		String[] seatArray = selectedName.split(",");
		System.out.println("seatArray: "+Arrays.toString(seatArray));
		
		Payments p = new Payments();
		p.setPaymentId(payId);
		p.setReservationId((String) paymentData.get("reservationId"));
		p.setPrice((String) paymentData.get("amount"));
		p.setPaymentMethod("2");
		p.setStatus("M");
		p.setMethod((String) paymentData.get("methodToget"));
		p.setReceipt((String) paymentData.get("vbank_date"));
		
		System.out.println(p);
		
		// 결제 테이블 생성
		int result = paymentsService.createPay(p);
		
		System.out.println(result);
		
		if(result>0) {
			Account ac = new Account(); 
			ac.setPaymentId(payId);
			ac.setBankName((String) paymentData.get("vbank_name"));
			ac.setUserNo(userNo);
			ac.setBankNum((String) paymentData.get("vbank_num"));
			ac.setName((String) paymentData.get("vbank_holder"));
			ac.setDueDate((String) paymentData.get("vbank_date"));
			
			// 무통장 테이블 생성
			int result2 = paymentsService.createAccount(ac);
			if(result2>0) {
				
				// 좌석별 티켓 생성
				Ticket t = new Ticket();
				t.setReservationId((String) paymentData.get("reservationId"));
				t.setPaymentId(payId);
				t.setRoundId((String) paymentData.get("roundId"));
				t.setSeatArray(seatArray);
				
				List<Seats> seatsId = (List)paymentsService.selectId(t);
				System.out.println(seatsId);
				t.setSeatsList(seatsId);
				System.out.println(t.getSeatsList().get(0).getSeatId());
				System.out.println(t.getSeatsList().get(1).getSeatId());
				int result3 = paymentsService.createTicket(t);
				
				System.out.println("최종 :"+result3);
				 if(result3>0) {
					 session.setAttribute("ac", ac);
					 session.setAttribute("p", p);
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
		
		Payments p = new Payments();
		Creditcard c = new Creditcard();
		c.setUserNo(userNo);
		p.setPaymentId(payId);
		p.setReservationId((String) paymentData.get("reservationId"));
		p.setPrice((String) paymentData.get("amount"));
		p.setPaymentMethod("1");
		p.setStatus("Y");
		p.setC(c);
		p.setMethod((String) paymentData.get("methodToget"));
		p.setReceipt((String) paymentData.get("vbank_date"));
		
		// 결제 테이블 생성
		int result = paymentsService.createPay(p);
		if(result>0) {
		
			// 카드 테이블 생성
			int result2 = paymentsService.createCard(p);
			if(result2>0) {
				
				// 좌석별 티켓 생성
				int result3 = 0;
				Ticket t = new Ticket();
				t.setReservationId((String) paymentData.get("reservationId"));
				t.setPaymentId(payId);
				t.setRoundId((String) paymentData.get("roundId"));
				
				 for(String seats : seatArray) {
					 	// 좌석 별 티켓 생성 
					 	t.setSeatName(seats);
					 	List<Seats> seatsId = (List)paymentsService.selectId(t);
						// t.setSeatId(seatsId);
					    int result4 = paymentsService.createTicket(t);
					
				        if (result4 == 0) {
				        	System.out.println ("좌석별 티켓 생성에 실패하였습니다. : " + seats);
				        }
				        
				        result3 += result4;
					 }
				 
				 if(seatArray.length==result3) {
					 session.setAttribute("p", p);
					 session.setAttribute("t", t);
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
	
	
	// 결제 실패시 
	@Transactional
	@ResponseBody
	@PostMapping(value = "/fail",produces ="text/html; charset=UTF-8")
	public String paymentFail(HttpSession session, @RequestParam int reservationId, @RequestParam int roundId) {
		
		 // 예약테이블 삭제  
		int resultReser = paymentsService.deleteReservation(reservationId);
		if (resultReser>0) {
			
			//  좌석상태 Y설정
			String selectedName = (String) session.getAttribute("selectedName");
			Seats s = new Seats();
			s.setRowName(selectedName);
			s.setRoundId(roundId);
				
			//int result = paymentsService.rollbackSeats(s);
			
			if(resultReser>0) {
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
		
//		if(p.getMethodToget()==1) {
//			model.addAttribute("methodToget","현장수령");
//		}else {
//			model.addAttribute("methodToget","택배수령");
//		}
		
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
	
	// 좌석 : 결제 중(P)
	@Transactional
	@ResponseBody
	@PostMapping(value = "/statusP",produces ="text/html; charset=UTF-8")
	public String statusP(String selectedName, int roundId) {

		Reservation r = new Reservation();
		r.setRoundId(roundId);
		List<String> seats = Arrays.asList(selectedName.split(","));
		r.setSeats(seats);
		
		int result = reservationService.updateSeatStatusP(r);
		System.out.println("seats: "+result);
		
		if(result >= 0) {
			return "Y";
		}else {
			return "N";
		}
	}

	// 결제 최종 완료시(예약은 Y / 좌석은 N) 
	@Transactional
	@ResponseBody
	@PostMapping(value = "/statusY",produces ="text/html; charset=UTF-8")
	public String statusY(Reservation r) {
			
		int result = reservationService.updateReserStatusY(r);
		int result2 = reservationService.updateSeatStatusN(r);
		
		if(result * result2 != 0) {
			return "Y";
		}else {
			return "N";
		}
		
	}
	
	// 환불을 위한 토큰 생성
	@ResponseBody
    @PostMapping(value="/getToken",produces ="text/html; charset=UTF-8")
    public String getToken() {
        try {
            String impKey = "2323070778660535";
            String impSecret = "IngmQdoVSwsDflBVemN0BdqDmNFv23GLsZj7wu2Z5e5WKAwzCsZUKAxHcLPEnP6mvulANGpV5hUmylMA";

            // 요청 데이터 JSON 객체
            JsonObject tokenRequest = new JsonObject();
            tokenRequest.addProperty("imp_key", impKey);
            tokenRequest.addProperty("imp_secret", impSecret);

            // HttpClient 및 HttpRequest 설정
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
							                    .uri(URI.create("https://api.iamport.kr/users/getToken"))
							                    .header("Content-Type", "application/json")
							                    .POST(HttpRequest.BodyPublishers.ofString(tokenRequest.toString())) // JsonObject를 문자열로 변환
							                    .build();
            
            // HTTP 요청 실행
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            // 응답 확인 
            // System.out.println("토큰 응답: " + response.body());

            // 응답 데이터를 JsonObject로 파싱
            JsonObject responseJson = JsonParser.parseString(response.body()).getAsJsonObject();
            JsonObject responseData = responseJson.getAsJsonObject("response"); // response 키에 접근
            String accessToken = responseData.get("access_token").getAsString(); // access_token 값 추출
            // System.out.println(accessToken);
            
            return accessToken; // 발급받은 Access Token 반환

        } catch (Exception e) {
            throw new RuntimeException("토큰 발급 실패: " + e.getMessage(), e);
        }
    }
	
	@CrossOrigin
	@ResponseBody
    @PostMapping(value="/cancel",produces ="text/html; charset=UTF-8")
    public String cancelPayment(Account ac,String token) {
            
			Map<String, Object> payload = new HashMap<>();
	        payload.put("merchant_uid", ac.getReservationId());
	        payload.put("reason", ac.getReason());
	        payload.put("amount", "100"); // 환불 금액
	        payload.put("refund_holder", ac.getRefund_holder()); // 가상계좌 환불 시 필요
	        payload.put("refund_bank", ac.getRefund_bank()); // 신한은행
	        payload.put("refund_account", ac.getRefund_account()); // 계좌 번호
			
        	String url = "https://api.iamport.kr/payments/cancel";

            // HTTP 요청 헤더 설정 _ token 사용을 위해 Bearer 작성
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", "Bearer " + token);
            
            // 요청 데이터 설정
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(payload, headers);

            // HTTP 요청 보내기
            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

            // 환불데이터 접근하기
            String responseBody = response.getBody();
            JsonObject jsonResponse = JsonParser.parseString(responseBody).getAsJsonObject();
            
            // code 0 이면 요청 성공
            int code = jsonResponse.get("code").getAsInt();
            if(code==0) {
            	 // 응답 반환
                return "Y";
            }else {
            	return "N";
            }
    }
	
	
	
	

	
}
