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

}
