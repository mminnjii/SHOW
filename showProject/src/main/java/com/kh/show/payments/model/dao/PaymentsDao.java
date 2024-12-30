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



	
	
}
