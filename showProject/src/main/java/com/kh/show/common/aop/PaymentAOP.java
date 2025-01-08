package com.kh.show.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
public class PaymentAOP {


	// 실행전 
	// @Before("target(com.kh.show.reservation.model.dao.ReservationDao)")
	public void before() {
		log.debug("before 실행");
	}
	
	
	
	// 실행 전 후 간섭
	@Around("target(com.kh.show.reservation.model.dao.ReservationDao)")
	public Object reservationTimeCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		// 시간 측정하는 작업 처리해서 대상 메소드가 수행되는 시간 log로 출력하기
		
		long start = System.currentTimeMillis(); 
		
		Object obj = joinPoint.proceed(); // 기존 메소드 실행
		
		long finish = System.currentTimeMillis(); 
		log.info("대상 {} :" ,joinPoint);
		log.info("수행시간 : {}초",(finish-start)/1000.0);
		
		
		log.debug("obj : {}",obj); // listCount 가장 먼저 실행되는 게시글 수
		log.debug("around로 간섭 (실행 후)");
		
		return obj; // 기존 메소드에서 반환받은 결과 반환
	}
	
}
