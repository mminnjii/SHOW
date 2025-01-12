package com.kh.show.payments.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.show.payments.model.vo.Account;
import com.kh.show.payments.model.vo.Payments;
import com.kh.show.reservation.model.vo.Seats;
import com.kh.show.reservation.model.vo.SeatsOfRow;
import com.kh.show.reservation.model.vo.Ticket;

@Repository
public class PaymentsDao {

	public int createPay(SqlSession session, Payments p) {
		return session.insert("paymentsMapper.createPay",p);
	}

	public List<Seats> selectId(SqlSession session, Ticket t) {
		return session.selectList("paymentsMapper.selectId",t);
	}
	
	public int createTicket(SqlSession session, Ticket t) {
		return session.insert("paymentsMapper.createTicket",t);
	}

	public int createAccount(SqlSession session, Account ac) {
		return session.insert("paymentsMapper.createAccount",ac);
	}

	public int rollbackSeats(SqlSession session, Seats s) {
		return session.update("paymentsMapper.rollbackSeats",s);
	}

	public int deleteReservation(SqlSession session, int reservationId) {
		return session.delete("paymentsMapper.deleteReservation",reservationId);
	}

	public int createCard(SqlSession session, Payments p) {
		return session.insert("paymentsMapper.createCard",p);
	}
	
}
