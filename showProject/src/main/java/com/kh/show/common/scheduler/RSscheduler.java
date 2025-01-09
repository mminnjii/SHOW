package com.kh.show.common.scheduler;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.show.reservation.model.vo.Reservation;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RSscheduler {
	
	// @Scheduled(initialDelay = 1000, fixedDelay = 2000)
	// @Scheduled(cron = "0 * * * * *") // 매분 마다
	public void scTest() {
		log.debug("스케쥴러 테스트");
	}
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// (예약)예약시작-결제완료 40분
	// @Scheduled(cron = "0 * * * * *") 
	private void reservationRollback() {
		int result = sqlsession.update("reservationMapper.reservationRollback");
		System.out.println("예약 : "+result);
	}
	
	// (좌석)예약시작-결제시작 10분
	// @Scheduled(cron = "0 * * * * *")
	private void seatsRollbackM() {
		int result = sqlsession.update("reservationMapper.seatsRollbackM");
		System.out.println("좌석 : "+ result);
	}
	
	// (좌석)결제시작-결제완료 30분
	// @Scheduled(cron = "0 * * * * *")
	private void seatsRollbackP() {
		int result = sqlsession.update("reservationMapper.seatsRollbackP");
		System.out.println("좌석 : "+ result);
	}
	
	
}
