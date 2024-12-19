package com.kh.show.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.customer.model.dao.CustomerServiceDao;
import com.kh.show.customer.model.vo.Faq;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerServiceDao cServiceDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// faq 리스트 
	@Override
	public ArrayList<Faq> selectFaqList() {
		
		return cServiceDao.selectFaqList(sqlSession);
	}

	// faq 카테고리별 리스트 
	@Override
	public ArrayList<Faq> faqFilterList(String qcategoryNo) {
		
		return cServiceDao.faqFilterList(sqlSession, qcategoryNo);
	}

}
