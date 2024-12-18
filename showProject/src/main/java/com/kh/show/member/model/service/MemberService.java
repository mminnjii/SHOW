package com.kh.show.member.model.service;

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
}
