package com.kh.show.payments.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.payments.model.dao.PaymentsDao;
import com.kh.show.payments.model.vo.Account;
import com.kh.show.payments.model.vo.Payments;
import com.kh.show.reservation.model.vo.Seats;
import com.kh.show.reservation.model.vo.SeatsOfRow;
import com.kh.show.reservation.model.vo.Ticket;

@Service
public class PaymentsServiceImpl implements PaymentsService {
	
	@Autowired
	private PaymentsDao paymentsDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int createPay(Payments p) {
		return paymentsDao.createPay(sqlSession,p);
	}

	@Override
	public int createTicket(Ticket t) {
		return paymentsDao.createTicket(sqlSession,t);
	}

	@Override
	public List<Seats> selectId(Ticket t) {
		return paymentsDao.selectId(sqlSession,t);
	}

	@Override
	public int createAccount(Account ac) {
		return paymentsDao.createAccount(sqlSession,ac);
	}

	@Override
	public int rollbackSeats(Seats s) {
		return paymentsDao.rollbackSeats(sqlSession,s);
	}

	@Override
	public int deleteReservation(int reservationId) {
		return paymentsDao.deleteReservation(sqlSession,reservationId);
	}

	@Override
	public int createCard(Payments p) {
		return paymentsDao.createCard(sqlSession,p);
	}

}
