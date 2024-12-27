package com.kh.show.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.common.template.PageInfo;
import com.kh.show.customer.model.vo.Question;
import com.kh.show.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck",checkId);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}

	public int memberAddress(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.memberAddress", map);
	}

	public int pwdCheck(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.pwdCheck",map);
	}

	public String memberPwd(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.memberPwd",userId);
	}

	public int updatePassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePassword",m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember",userId);
	}

	public String findId(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.findId",map);
	}

	public int findPwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.findPwd",map);
	}

	public int updateNewPassword(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.updateNewPassword",map);
	}

	public int startSub(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.startSub",userId);
	}

	public int listCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.listCount",userNo);
	}

	public ArrayList<Question> qnaList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.qnaList",userNo, rowbounds);
	}

}
