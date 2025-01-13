package com.kh.show.common.scheduler;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.show.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CouponScheduler {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
	// 매 월 10일 등급 쿠폰
	@Scheduled(cron = "*/5 * * * * *") 
	private void rankCoupon() {
		
		ArrayList<Member> white = (ArrayList)sqlsession.selectList("memberMapper.whiteList");
		// int member = sqlsession.selectOne("memberMapper.whiteList");
//		int countB = sqlsession.selectOne("memberMapper.blueList");
//		int countR = sqlsession.selectOne("memberMapper.redList");
//		int countBk = sqlsession.selectOne("memberMapper.blackList");
		System.out.println(white);
		for(Member userNo : white) {
			int result = sqlsession.insert("memberMapper.rankCoupon",userNo);
			log.debug("result : ", result);
		}
				
	}


	
	// 매 월 10일 맴버십 쿠폰
//	@Scheduled(cron = "0 0 0 10 * *") 
//	private void subscribeCoupon() {
//		int result = sqlsession.insert("memberMapper.subscribeCoupon");
//		log.debug("subscribeCoupon : "+ result);
//	}

}
