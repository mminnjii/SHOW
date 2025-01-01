package com.kh.show.payments.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentsDao {

	public int createPay(SqlSession session, Map<String, Object> info) {
		return session.insert("paymentsMapper.createPay",info);
	}

	public int selectId(SqlSession session, Map<String, Object> ticket) {
		return session.selectOne("paymentsMapper.selectId",ticket);
	}
	
	public int createTicket(SqlSession session, Map<String, Object> ticket) {
		return session.insert("paymentsMapper.createTicket",ticket);
	}

	public int createAccount(SqlSession session, Map<String, Object> info) {
		return session.insert("paymentsMapper.createAccount",info);
	}

	public int rollbackSeats(SqlSession session, Map<String, Object> data) {
		return session.update("paymentsMapper.rollbackSeats",data);
	}

	public int deleteReservation(SqlSession session, Map<String, Object> data) {
		return session.delete("paymentsMapper.deleteReservation",data);
	}

	public int createCard(SqlSession session, Map<String, Object> info) {
		return session.insert("paymentsMapper.createCard",info);
	}



	
	
}
