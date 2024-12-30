package com.kh.show.customer.model.service;

import java.util.ArrayList;

import com.kh.show.customer.model.vo.Faq;
import com.kh.show.customer.model.vo.Question;
import com.kh.show.reservation.model.vo.Reservation;

public interface CustomerService {

	// FAQ 리스트
	ArrayList<Faq> selectFaqList();
	
	// faq 카테고리별 리스트
	ArrayList<Faq> faqFilterList(String qcategoryNo);

	// faq search List
	ArrayList<Faq> faqSearchList(String keyword);

	// 1:1 문의 
	int questionInsert(Question q);

	// 1:1 문의 비회원 
	int questionNonInsert(Question q);

	// 회원 예약 번호 출력 
	ArrayList<Reservation> reSearch(int userNo);

	int faqCount(String faqNo);

	//문의 상세 페이지
	Question selectQna(int qno);

	//문의 내용 삭제
	int qnaDelete(int questionNo);

	//문의 업데이트
	int updateQna(Question q);
	

}
