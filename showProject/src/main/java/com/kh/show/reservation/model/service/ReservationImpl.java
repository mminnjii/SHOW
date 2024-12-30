package com.kh.show.reservation.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.reservation.model.dao.ReservationDao;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.reservation.model.vo.SeatsOfRow;

@Service
public class ReservationImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<SeatsOfRow> selectSeatsNum() {
		return reservationDao.selectSeatsNum(sqlSession);
	}
	
	@Override
	public ArrayList<String> selectTakenSeats() {
		return reservationDao.selectTakenSeats(sqlSession);
	}

	@Override
	public int updateTotalNum(int num) {
		return reservationDao.updateTotalNum(sqlSession,num);
	}

	@Override
	public int updateSeatStatus(String name) {
		return reservationDao.updateSeatStatus(sqlSession,name);
	}

	@Override
	public int createReservation(Map<String, Object> r) {
		return reservationDao.createReservation(sqlSession,r);
	}

	@Override
	public Reservation selectReservation() {
		return reservationDao.selectReservation(sqlSession);
	}

	@Override
	public Reservation confirmReservation(String reservationId) {
		return reservationDao.confirmReservation(sqlSession,reservationId);
	}


}
