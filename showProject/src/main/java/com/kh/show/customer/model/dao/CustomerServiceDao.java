package com.kh.show.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.customer.model.vo.Faq;

@Repository
public class CustomerServiceDao {

	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("custopperMapper.selectFaqList");
	}

	public ArrayList<Faq> faqFilterList(SqlSessionTemplate sqlSession, String qcategoryNo) {

		return (ArrayList)sqlSession.selectList("custopperMapper.faqFilterList", qcategoryNo);
	}

}
