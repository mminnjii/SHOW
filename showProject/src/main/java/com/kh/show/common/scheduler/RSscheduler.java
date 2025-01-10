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
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// (예약)예약시작-결제완료 40분
	@Scheduled(cron = "0 0/40 * * * *") 
	private void reservationRollback() {
		int result = sqlsession.update("reservationMapper.reservationRollback");
		log.debug("예약 reservationRollbackN : "+result);
	}
	
	// (좌석)예약시작-결제시작 10분
	@Scheduled(cron = "0 0/10 * * * *") 
	private void seatsRollbackM() {
		int result = sqlsession.update("reservationMapper.seatsRollbackM");
		log.debug("좌석 seatsRollbackMtoY : "+ result);
	}
	
	// (좌석)결제시작-결제완료 30분
	@Scheduled(cron = "0 0/30 * * * *") 
	private void seatsRollbackP() {
		int result = sqlsession.update("reservationMapper.seatsRollbackP");
		log.debug("좌석 seatsRollbackPtoY : "+ result);
	}
	
	
}
