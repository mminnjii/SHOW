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
	@Scheduled(cron = "0 0 0 10 * *") 
	private void rankCoupon() {
		
		ArrayList<Member> white = (ArrayList)sqlsession.selectList("memberMapper.whiteList");
		ArrayList<Member> blue = (ArrayList)sqlsession.selectList("memberMapper.blueList");
		ArrayList<Member> red = (ArrayList)sqlsession.selectList("memberMapper.redList");
		ArrayList<Member> black = (ArrayList)sqlsession.selectList("memberMapper.blackList");

		for(Member userNo : white) {
			int result = sqlsession.insert("memberMapper.whiteCoupon",userNo);
		}
		
		for(Member userNo : blue) {
			int result = sqlsession.insert("memberMapper.blueCoupon",userNo);
		}
		
		for(Member userNo : red) {
			int result = sqlsession.insert("memberMapper.redCoupon",userNo);
		}
		
		for(Member userNo : black) {
			int result = sqlsession.insert("memberMapper.blackCoupon",userNo);
		}
				
	}


	
	// 매 월 10일 맴버십 쿠폰
	@Scheduled(cron = "0 0 0 10 * *") 
	private void subscribeCoupon() {
		ArrayList<Member> mem = (ArrayList)sqlsession.selectList("memberMapper.membershipList");

		for(Member userNo : mem) {
			int result = sqlsession.insert("memberMapper.membershipCoupon",userNo);
			log.debug("result : ",result);
		}
	}

}
