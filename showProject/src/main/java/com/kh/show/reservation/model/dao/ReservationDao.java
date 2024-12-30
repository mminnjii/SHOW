package com.kh.show.reservation.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.reservation.model.vo.SeatsOfRow;

@Repository
public class ReservationDao {
	
	
	public ArrayList<SeatsOfRow> selectSeatsNum(SqlSession session, int roundId) {
		return (ArrayList)session.selectList("reservationMapper.selectSeatsNum",roundId);
	}

	public ArrayList<String> selectTakenSeats(SqlSession session, int roundId) {
		return (ArrayList)session.selectList("reservationMapper.selectTakenSeats",roundId);
	}
	
	public int updateTotalNum(SqlSession session, int num) {
		return session.update("reservationMapper.updateTotalNum",num);
	}

	public int updateSeatStatus(SqlSession session, Map<String, Object> seats) {
		return session.update("reservationMapper.updateSeatStatus",seats);
	}

	public int createReservation(SqlSession session, Map<String, Object> r) {
		return session.insert("reservationMapper.createReservation",r);
	}

	public Reservation selectReservation(SqlSession session) {
		return session.selectOne("reservationMapper.selectReservation");
	}

	public Reservation confirmReservation(SqlSession session, String reservationId) {
		return session.selectOne("reservationMapper.confirmReservation",reservationId);
	}



}
