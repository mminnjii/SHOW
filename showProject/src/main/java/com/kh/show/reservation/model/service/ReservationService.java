package com.kh.show.reservation.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.reservation.model.vo.SeatsOfRow;

public interface ReservationService {
	
	
	// status "N"인 좌석 조회
	ArrayList<String> selectTakenSeats(int roundId);
	
	// 등급별 좌석 수 조회
	ArrayList<SeatsOfRow> selectSeatsNum(int roundId);
	
	// 좌석 상태 변환
	int updateSeatStatus(Map<String, Object> seats);
	
	// reservation 생성
	int createReservation(Map<String, Object> r);
	
	// 생성된 reservation 읽어오기
	Reservation selectReservation();
	
	// 결제 전 예약정보 확인
	Reservation confirmReservation(String reservationId);


	
	

}
