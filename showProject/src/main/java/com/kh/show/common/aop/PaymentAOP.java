package com.kh.show.common.aop;

import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import com.kh.show.reservation.model.vo.Reservation;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
public class PaymentAOP {

//	@Autowired
//	private PaymentsController paymentsContoller;
	
	private long startReservation;
	private long finishReservation;
	private long reservationTimeCheck;
	
	private long startPayments;
	private long finishPayments;
	private long paymentsTimeCheck;
	
	// @Around("execution(* com.kh.show.reservation.model.dao.*.*(..)) || execution(* com.kh.show.payments.controller.PaymentsController(..)))")
	public Object reservationTimeCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		
		Object obj = joinPoint.proceed(); // 기존 메소드 실행
		String methodName = joinPoint.getSignature().getName(); // 대상 메소드명 추출
		log.info("AOP 실행됨: 메소드명 = {}", methodName);
		
		if(methodName.equals("createReservation")) {
			startReservation = System.currentTimeMillis(); 
			log.info("예약 메소드명 {} :" ,methodName);            
			}
		
		if(methodName.equals("processPayment")) { // 결제 클릭 후 controller 
			finishReservation = System.currentTimeMillis();
			log.info("결제 메소드명 {} :" ,methodName);
			reservationTimeCheck = (long) ((finishReservation-startReservation)/1000.0);
			log.info("예약-결제클릭까지 수행시간 : {}초",reservationTimeCheck);
			
			Object[] args = joinPoint.getArgs();
			Object o2 =  args[1];
			
			log.debug("o2 : {}",o2);
			
//			Map<String, Object> map = (Map<String, Object>) o2;
//			String reservationId = (String) map.get("reservationId");
//            
//            log.debug("reservationId : {}",reservationId);

		}
		
//		if(reservationTimeCheck > 600.0) { // 예약-결제전 10분 넘어가면
//			paymentsContoller.paymentFail(null, 0, 0);
//		}
		
		return obj; // 기존 메소드에서 반환받은 결과 반환
	}

	@Around("execution(* com.kh.show.payments.controller.*.*(..))")
	public Object test(ProceedingJoinPoint joinPoint) throws Throwable {
		
		Object obj = joinPoint.proceed(); // 기존 메소드 실행
		String methodName = joinPoint.getSignature().getName(); // 대상 메소드명 추출
		log.info("AOP 실행됨: 메소드명 = {}", methodName);

		return obj; // 기존 메소드에서 반환받은 결과 반환
	}
	
	
	@Around("execution(* com.kh.show.payments.model.dao.*.*(..))")
	public Object paymentsTimeCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		// 시간 측정하는 작업 처리해서 대상 메소드가 수행되는 시간 log로 출력하기
		Object obj = joinPoint.proceed(); // 기존 메소드 실행
		String methodName = joinPoint.getSignature().getName(); // 대상 메소드명 추출
		if(methodName.equals("createPay")) {
			startPayments = System.currentTimeMillis(); 
			log.info("결제 메소드명 {} :" ,methodName);
			}
		
		// pamentInfo
		if(methodName.equals("createCard") || methodName.equals("createAccount")) {
			finishPayments = System.currentTimeMillis();
			log.info("카드 무통장 메소드명 {} :" ,methodName);
			log.info("결제-완료까지 수행시간 : {}초",(finishPayments-startPayments)/1000.0);
		}
		
		if(paymentsTimeCheck > 1800.0) { // 예약-결제전 30분 넘어가면
			// paymentsContoller.paymentFail(null, 0, 0);
		}
		
		return obj; // 기존 메소드에서 반환받은 결과 반환
	}
	
}
