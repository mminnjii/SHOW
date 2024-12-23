package com.kh.show.member.model.service;

import java.util.HashMap;

import com.kh.show.member.model.vo.Member;

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
}
