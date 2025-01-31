package com.kh.show.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ChatJoin;
import com.kh.show.common.template.PageInfo;
import com.kh.show.customer.model.vo.Question;
import com.kh.show.meeting.model.vo.Meeting;
import com.kh.show.meeting.model.vo.MeetingJoin;
import com.kh.show.member.model.dao.MemberDao;
import com.kh.show.member.model.vo.Coupon;
import com.kh.show.member.model.vo.Member;
import com.kh.show.payments.model.vo.Payments;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.showInfo.model.vo.Review;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//로그인
	@Override
	public Member loginMember(Member m) {

		Member loginUser = memberDao.loginMember(sqlSession,m);
		
		return loginUser;
	}

	//회원가입
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession,m);
	}

	//정보 수정
	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession,m);
	}

	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(sqlSession,userId);
	}

	//아이디 중복 확인
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession,checkId);
	}

	@Override
	public int memberAddress(HashMap<String, String> map) {
		return memberDao.memberAddress(sqlSession,map);
	}

	@Override
	public String memberPwd(String userId) {
		return memberDao.memberPwd(sqlSession,userId);
	}

	@Override
	public int updatePassword(Member m) {
		return memberDao.updatePassword(sqlSession,m);
	}

	@Override
	public String findId(HashMap<String, String> map) {
		return memberDao.findId(sqlSession,map);
	}

	@Override
	public int findPwd(HashMap<String, String> map) {
		return memberDao.findPwd(sqlSession,map);
	}

	@Override
	public int updateNewPassword(HashMap<String, String> map) {
		return memberDao.updateNewPassword(sqlSession,map);
	}

	@Override
	public int startSub(String userId) {
		return memberDao.startSub(sqlSession,userId);
	}

	@Override
	public int listCount(int userNo) {
		return memberDao.listCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<Question> qnaList( int userNo, PageInfo pi) {
		return memberDao.qnaList(sqlSession,userNo,pi);
	}

	@Override
	public int rListCount(int userNo) {
		return memberDao.rListCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<Review> reviewList(int userNo, PageInfo pi) {
		return memberDao.reviewList(sqlSession,userNo,pi);
	}

	@Override
	public int sListCount(int userNo) {
		return memberDao.sListCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<Reservation> showList(int userNo, PageInfo pi) {
		return memberDao.showList(sqlSession,userNo,pi);
	}


	@Override
	public int couponCount(int userNo) {
		return memberDao.couponCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<Coupon> couponList(int userNo) {
		return memberDao.couponList(sqlSession,userNo);
	}

	@Override
	public int pListCount(int userNo) {
		return memberDao.pListCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<Reservation> payList(int userNo, PageInfo pi) {
		return memberDao.payList(sqlSession,userNo,pi);
	}

	@Override
	public int reserveCount(int userNo) {
		return memberDao.reserveCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<Reservation> reserveList(int userNo, PageInfo pi) {
		return memberDao.reserveList(sqlSession,userNo,pi);
	}

	@Override
	public int cancelRes(String reservationId) {
		return memberDao.cancelRes(sqlSession,reservationId);
	}

	@Override
	public int cancelTicket(String reservationId) {
		return memberDao.cancelTicket(sqlSession,reservationId);
	}

	@Override
	public int cancelPay(String reservationId) {
		return memberDao.cancelPay(sqlSession,reservationId);
	}

	@Override
	public int rollbackSeats(int seatId) {
		return memberDao.rollbackSeats(sqlSession,seatId);
	}

	@Override
	public int phoneCheck(String phone) {
		return memberDao.phoneCheck(sqlSession,phone);
	}

	@Override
	public int chatCount(int userNo) {
		return memberDao.chatCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<ChatJoin> chatList(int userNo, PageInfo pi) {
		return memberDao.chatList(sqlSession,userNo,pi);
	}

	@Override
	public int chatCount2(int userNo) {
		return  memberDao.chatCount2(sqlSession,userNo);
	}

	@Override
	public ArrayList<Chat> chatList2(int userNo, PageInfo pi) {
		return memberDao.chatList2(sqlSession,userNo,pi);
	}

	@Override
	public int meetingCount(int userNo) {
		return memberDao.meetingCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<MeetingJoin> meetingList(int userNo, PageInfo pi) {
		return memberDao.meetingList(sqlSession,userNo,pi);
	}

	@Override
	public int meetingCount2(int userNo) {
		return memberDao.meetingCount2(sqlSession,userNo);
	}

	@Override
	public ArrayList<Meeting> meetingList2(int userNo, PageInfo pi) {
		return memberDao.meetingList2(sqlSession,userNo,pi);
	}
	
	
	// 쿠폰 사용 후 취소
	@Override
	public int cancelCoupon(int couponNo) {
		return memberDao.cancelCoupon(sqlSession,couponNo);
	}

	@Override
	public int cancelSub(int userNo) {
		return memberDao.cancelSub(sqlSession,userNo);
	}


	

}
