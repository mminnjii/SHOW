package com.kh.show.manager.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.customer.model.vo.Faq;
import com.kh.show.customer.model.vo.ManagerQuestion;
import com.kh.show.customer.model.vo.ManagerQuestion2;
import com.kh.show.manager.model.vo.Manager;
import com.kh.show.member.model.vo.Member;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.reservation.model.vo.ManagerPageReservation2;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.showInfo.model.vo.ManagerShowInfo;
import com.kh.show.showInfo.model.vo.ManagerShowInfo2;
import com.kh.show.showInfo.model.vo.ManagerUpdateShow;
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
	public List<ManagerShowInfo> selectAllShow(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("managerMapper.selectAllShow");
	}
	
	public List<ManagerQuestion> selectAllQuestion(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("managerMapper.selectAllQuestion");
	}
	
	public List<Notice> updateNoticeInform(SqlSessionTemplate sqlSession, Long noticeNo) {
		
		return sqlSession.selectList("managerMapper.updateNoticeInform", noticeNo);
	}

	public int insertFaq(SqlSessionTemplate sqlSession, Faq f) {

		return sqlSession.insert("managerMapper.insertFaq", f);
	}

	public Notice noticeDetail(SqlSessionTemplate sqlSession, int noticeNo) {

		return sqlSession.selectOne("managerMapper.noticeDetail", noticeNo);
	}

	public Faq faqDetail(SqlSessionTemplate sqlSession, int faqNo) {

		return sqlSession.selectOne("managerMapper.faqDetail", faqNo);
	}

	public ManagerShowInfo2 showDetail(SqlSessionTemplate sqlSession, int showNo) {

		return sqlSession.selectOne("managerMapper.showDetail", showNo);
	}

	public ManagerPageReservation2 reservDetail(SqlSessionTemplate sqlSession, int reservNo) {

		return sqlSession.selectOne("managerMapper.reservDetail", reservNo);
	}

	public ManagerQuestion2 questionDetail(SqlSessionTemplate sqlSession, int qNo) {
		
		return sqlSession.selectOne("managerMapper.questionDetail", qNo);
	}

	public Notice beforeNoticeUpdate(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("managerMapper.beforeNoticeUpdate", noticeNo);
	}

	public int afterNoticeUpdate(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.update("managerMapper.afterNoticeUpdate", notice);
	}

	public Faq beforeFaqUpdate(SqlSessionTemplate sqlSession, int faqNo) {
		
		return sqlSession.selectOne("managerMapper.beforeFaqUpdate", faqNo);
	}

	public int afterFaqUpdate(SqlSessionTemplate sqlSession, Faq faq) {

		return sqlSession.update("managerMapper.afterFaqUpdate", faq);
	}

	public Member beforeUserUpdate(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("managerMapper.beforeUserUpdate", userNo);
	}

	public int afterUserUpdate(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("managerMapper.afterUserUpdate", m);
	}

	public ManagerUpdateShow beforeShowUpdate(SqlSessionTemplate sqlSession, int showNo) {
		
		return sqlSession.selectOne("managerMapper.beforeShowUpdate", showNo);
	}

	public int afterShowUpdate(SqlSessionTemplate sqlSession, Show show) {
		
		return sqlSession.update("managerMapper.afterShowUpdate", show);
	}
}
