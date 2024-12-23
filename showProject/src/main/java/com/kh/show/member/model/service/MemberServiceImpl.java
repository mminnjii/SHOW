package com.kh.show.member.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.member.model.dao.MemberDao;
import com.kh.show.member.model.vo.Member;

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

	

}
