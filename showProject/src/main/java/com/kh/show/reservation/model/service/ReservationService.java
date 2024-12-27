package com.kh.show.reservation.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.show.reservation.model.vo.SeatsOfRow;

public interface ReservationService {
	
	
	// status "N"인 좌석 조회
	ArrayList<String> selectTakenSeats();
	
	// 등급별 좌석 수 조회
	ArrayList<SeatsOfRow> selectSeatsNum();
	
	// 공연장(hall)테이블 총좌석 수 변환(-).
	int updateTotalNum(int num);
	
	// 좌석 상태 변환
	int updateSeatStatus(String name);
	
	// reservation 생성
	int createReservation(Map<String, Object> r);

	
	

}
