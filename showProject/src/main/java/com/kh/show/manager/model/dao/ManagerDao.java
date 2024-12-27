package com.kh.show.manager.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.customer.model.vo.Faq;
import com.kh.show.manager.model.vo.Manager;
import com.kh.show.member.model.vo.Member;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.showInfo.model.vo.Show;

@Repository
public class ManagerDao {

//	관리자 로그인
	public Manager loginManager(SqlSessionTemplate sqlSession, Manager m) {
		return sqlSession.selectOne("managerMapper.loginManager",m);
	}
	
//	공연 작성
	public int showInsert(SqlSessionTemplate sqlSession, Show show) {
		
		return sqlSession.insert("managerMapper.showInsert", show);
	}

//	공지사항 작성
	public int noticeInsert(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("managerMapper.insertNotice", n);
	}

//	공지사항 불러오기
	public List<Notice> selectAllNotice(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("managerMapper.selectAllNotice");
	}

//	FAQ 불러오기
	public List<Faq> selectAllFaq(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("managerMapper.selectAllFaq");
	}

//	회원 불러오기
	public List<Member> selectAllMember(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("managerMapper.selectAllMember");
	}
	
//	예약 불러오기
	public List<Reservation> selectAllReserv(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("managerMapper.selectAllReserv");
	}
	
//	공연 불러오기
	public List<Show> selectAllShow(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("managerMapper.selectAllShow");
	}

	

	
	
}
