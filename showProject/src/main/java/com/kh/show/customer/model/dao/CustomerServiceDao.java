package com.kh.show.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.customer.model.vo.Faq;
import com.kh.show.customer.model.vo.Question;
import com.kh.show.reservation.model.vo.Reservation;

@Repository
public class CustomerServiceDao {

	// faq 리스트 
	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("customerMapper.selectFaqList");
	}

	// faq 카테고리별 리스트 
	public ArrayList<Faq> faqFilterList(SqlSessionTemplate sqlSession, String qcategoryNo) {

		return (ArrayList)sqlSession.selectList("customerMapper.faqFilterList", qcategoryNo);
	}

	// faq 키워드 검색 리스트
	public ArrayList<Faq> faqSearchList(SqlSessionTemplate sqlSession, String keyword) {

		return (ArrayList)sqlSession.selectList("customerMapper.faqSearchList",keyword);
	}

	// 1:1 문의 저장 메소드 
	public int questionInsert(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.insert("customerMapper.questionInsert", q);
	}

	// 1:1 문의 저장 메소드 - 비회원
	public int questionNonInsert(SqlSessionTemplate sqlSession, Question q) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customerMapper.questionNonInsert", q);
	}

	// 회원 예약 번호 출력 메소드 
		// Reservation import 다시하기 mapper도 reservation으로 이동?  
	public ArrayList<Reservation> reSearch(SqlSessionTemplate sqlSession, int userNo) {
		System.out.println(userNo);
		return (ArrayList)sqlSession.selectList("reservationMapper.reSearch", userNo);
	}

	// count up 
	public int faqCount(SqlSessionTemplate sqlSession, String faqNo) {
		return sqlSession.update("customerMapper.faqCount", faqNo);
	}

	public Question selectQna(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("customerMapper.selectQna",qno);
	}

	public int qnaDelete(SqlSessionTemplate sqlSession, int questionNo) {
		return sqlSession.delete("customerMapper.qnaDelete",questionNo);
	}

	public int updateQna(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.update("customerMapper.updateQna",q);
	}

}
