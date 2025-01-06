package com.kh.show.payments.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.payments.model.dao.PaymentsDao;

@Service
public class PaymentsServiceImpl implements PaymentsService {
	
	@Autowired
	private PaymentsDao paymentsDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int createPay(Map<String, Object> info) {
		return paymentsDao.createPay(sqlSession,info);
	}

	@Override
	public int createTicket(Map<String, Object> ticket) {
		return paymentsDao.createTicket(sqlSession,ticket);
	}

	@Override
	public int selectId(Map<String, Object> ticket) {
		return paymentsDao.selectId(sqlSession,ticket);
	}

	@Override
	public int createAccount(Map<String, Object> info) {
		return paymentsDao.createAccount(sqlSession,info);
	}

	@Override
	public int rollbackSeats(Map<String, Object> data) {
		return paymentsDao.rollbackSeats(sqlSession,data);
	}

	@Override
	public int deleteReservation(Map<String, Object> data) {
		return paymentsDao.deleteReservation(sqlSession,data);
	}

	@Override
	public int createCard(Map<String, Object> info) {
		return paymentsDao.createCard(sqlSession,info);
	}

}
