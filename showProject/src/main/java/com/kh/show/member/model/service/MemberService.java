package com.kh.show.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.show.common.template.PageInfo;
import com.kh.show.customer.model.vo.Question;
import com.kh.show.member.model.vo.Coupon;
import com.kh.show.member.model.vo.Member;
import com.kh.show.payments.model.vo.Payments;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.showInfo.model.vo.Review;

public interface MemberService {
	
	//로그인 서비스
	Member loginMember(Member m);
	//회원가입 서비스
	int insertMember(Member m);
	//회원정보 수정 서비스
	int updateMember(Member m);
	//회원탈퇴 서비스
	int deleteMember(String userId);
	//아이디 중복체크 서비스
	int idCheck(String checkId);
	//회원 배송지 서비스
	int memberAddress(HashMap<String, String> map);
	//아이디로 기존 비밀번호 불러오기 
	String memberPwd(String userId);
	//비밀번호 업데이트
	int updatePassword(Member m);
	//아이디 찾기 서비스
	String findId(HashMap<String, String> map);
	//비밀번호 찾고 변경
	int findPwd(HashMap<String, String> map);
	//비밀번호 찾고 변경2
	int updateNewPassword(HashMap<String, String> map);
	//구독 서비스
	int startSub(String userId);
	
	//문의 목록 수 조회
	int listCount(int userNo);
	//회원 qna 목록 조회
	ArrayList<Question> qnaList(int userNo, PageInfo pi);
	//리뷰 수 조회
	int rListCount(int userNo);
	//리뷰 목록 추출
	ArrayList<Review> reviewList(int userNo, PageInfo pi);
	//공연 수 조회
	int sListCount(int userNo);
	//공연 목록 조회
	ArrayList<Reservation> showList(int userNo, PageInfo pi);
	//쿠폰 수 조회
	int couponCount(int userNo);
	//쿠폰 리스트 추출
	ArrayList<Coupon> couponList(int userNo);
	//결제 수 조회
	int pListCount(int userNo);
	//결제 리스트 추출
	ArrayList<Reservation> payList(int userNo, PageInfo pi);
	//예약 수 조회
	int reserveCount(int userNo);
	//예약 리스트 추출
	ArrayList<Reservation> reserveList(int userNo, PageInfo pi);
	//예약 취소 
	int cancelRes(String reservationId);
	//x티켓 취소
	int cancelTicket(String reservationId);
	//결제 취소
	int cancelPay(String reservationId);
	//빈좌석 표시
	int rollbackSeats(int seatId);
}
