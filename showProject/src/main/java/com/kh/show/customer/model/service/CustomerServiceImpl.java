package com.kh.show.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.customer.model.dao.CustomerServiceDao;
import com.kh.show.customer.model.vo.Faq;
import com.kh.show.customer.model.vo.Question;
import com.kh.show.customer.model.vo.Reservation;

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

	// 키워드 검색 리스트 
	@Override
	public ArrayList<Faq> faqSearchList(String keyword) {
		return cServiceDao.faqSearchList(sqlSession, keyword);
	}

	// 1:1문의 내역 저장 메소드 
	@Override
	public int questionInsert(Question q) {

		return cServiceDao.questionInsert(sqlSession, q);
	}

	// 1:1 문의 비회원 
	@Override
	public int questionNonInsert(Question q) {
		return cServiceDao.questionNonInsert(sqlSession, q);
	}

	// 회원 예약 내역 출력 메소드 
	// Reservation import 다시하기
	@Override
	public ArrayList<Reservation> reSearch(int userNo) {
		System.out.println("서비스" +userNo);
		return cServiceDao.reSearch(sqlSession, userNo);
	}

}
