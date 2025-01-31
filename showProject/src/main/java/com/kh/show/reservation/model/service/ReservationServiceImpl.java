package com.kh.show.reservation.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.reservation.model.dao.ReservationDao;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.reservation.model.vo.Seats;
import com.kh.show.reservation.model.vo.SeatsOfRow;
import com.kh.show.reservation.model.vo.Ticket;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<SeatsOfRow> selectSeatsNum(int roundId) {
		return reservationDao.selectSeatsNum(sqlSession,roundId);
	}
	
	@Override
	public ArrayList<String> selectTakenSeats(int roundId) {
		return reservationDao.selectTakenSeats(sqlSession,roundId);
	}

	@Override
	public int updateSeatStatus(Map<String, Object> seats) {
		return reservationDao.updateSeatStatus(sqlSession,seats);
	}

	@Override
	public int createReservation(Reservation r) {
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

	@Override
	public ArrayList<Ticket> confirmTicket(String reservationId) {
		return reservationDao.confirmTicket(sqlSession,reservationId);
	}

	@Override
	public int updateSeatStatusN(Reservation r) {
		return reservationDao.updateSeatStatusN(sqlSession,r);
	}

	@Override
	public int updateReserStatusY(Reservation r) {
		return reservationDao.updateReserStatusY(sqlSession,r);
	}

	@Override
	public int updateSeatStatusP(Reservation r) {
		return reservationDao.updateSeatStatusP(sqlSession,r);
	}


}
