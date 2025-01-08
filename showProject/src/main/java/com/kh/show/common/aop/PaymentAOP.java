package com.kh.show.common.aop;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.show.payments.model.service.PaymentsService;
import com.kh.show.reservation.model.service.ReservationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
public class PaymentAOP {

	@Autowired
	private PaymentsService paymentsService;
		
	@Autowired
	private HttpSession session;
	
	private long startReservation;
	private long finishReservation;
	private long reservationTimeCheck;
	
	private long startPayments;
	private long finishPayments;
	private long paymentsTimeCheck;
	private String Seats;
	
	
	private int reservationId = 0;
	private int roundId = 0;
	
	@Around("execution(* com.kh.show.reservation.model.dao.*.*(..)) || execution(* com.kh.show.payments.controller.*.*(..))")
	public Object reservationTimeCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		
		Object obj = joinPoint.proceed(); // 기존 메소드 실행
		String methodName = joinPoint.getSignature().getName(); // 대상 메소드명 추출
		
		if(methodName.equals("createReservation")) {
			startReservation = System.currentTimeMillis();
			}
		
		if(methodName.equals("processPayment")) { // 결제 클릭 후 controller 
			finishReservation = System.currentTimeMillis();
			reservationTimeCheck = (long) ((finishReservation-startReservation)/1000.0);
			log.info("예약-결제클릭까지 수행시간 : {}초",reservationTimeCheck);
			// 보낼 데이터 가져오기
			Object[] args = joinPoint.getArgs();
			reservationId =  (int) args[0];
			roundId = (int) args[1];
			Seats =  (String) args[2];	
			log.info("reservationId : {}",reservationId);
			log.info("roundId : {}",roundId);
			log.info("Seats : {}",Seats);
			}
		
		if(reservationTimeCheck > 60.0) { // 예약-결제전 10분 넘어가면 
			// 예약 좌석 rollback
			Map<String, Object> data = new HashMap<>();
			data.put("reservationId", reservationId);
			int reservationRollback = paymentsService.deleteReservation(data);
			log.info("reservationRollback 결과 성공 : {}개",reservationRollback);
			
			String[] seatArray = Seats.split(",");
			for(String seats : seatArray) {
				data.put("seats", seats);
				 int seatsRollback = paymentsService.rollbackSeats(data);
				 log.info("data : {}",data.get("reservationId"));
				 log.info("data : {}",data.get("seats"));
				 log.info("seatsRollback 결과 성공 : {}개",seatsRollback);
			}
		}
		
		return obj; // 기존 메소드에서 반환받은 결과 반환
	}
	
	

	@Around("execution(* execution(* com.kh.show.payments.controller.*.*(..)) || com.kh.show.payments.model.dao.*.*(..))")
	public Object paymentsTimeCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		Object obj = joinPoint.proceed(); // 기존 메소드 실행
		String methodName = joinPoint.getSignature().getName(); // 대상 메소드명 추출
		if(methodName.equals("processPayment")) {
			startPayments = System.currentTimeMillis(); 
			log.info("결제 메소드명 {} :" ,methodName);
			
			Object[] args = joinPoint.getArgs();
			reservationId =  (int) args[0];
			roundId = (int) args[1];
			Seats =  (String) args[2];			
		}
		
	
		if(methodName.equals("createCard") || methodName.equals("createAccount")) {
			finishPayments = System.currentTimeMillis();
			log.info("카드 무통장 메소드명 {} :" ,methodName);
			log.info("결제-완료까지 수행시간 : {}초",(finishPayments-startPayments)/1000.0);
		}
		
//		if(paymentsTimeCheck > 1800.0) { // 결제클릭-결제완료전 30분 넘어가면
//			
//		}
		
		return obj; // 기존 메소드에서 반환받은 결과 반환
	}
	
}
