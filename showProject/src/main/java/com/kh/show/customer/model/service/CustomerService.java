package com.kh.show.customer.model.service;

import java.util.ArrayList;

import com.kh.show.customer.model.vo.Faq;

public interface CustomerService {

	
	// FAQ 리스트
	ArrayList<Faq> selectFaqList();

	ArrayList<Faq> faqFilterList(String qcategoryNo);
	
	
	// 1:1 문의 
	
	

}
