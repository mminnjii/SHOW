package com.kh.show.manager.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ManagerChat;
import com.kh.show.customer.model.vo.Faq;
import com.kh.show.customer.model.vo.ManagerQuestion;
import com.kh.show.customer.model.vo.ManagerQuestion2;
import com.kh.show.manager.model.vo.Manager;
import com.kh.show.meeting.model.vo.ManagerMeeting;
import com.kh.show.meeting.model.vo.Meeting;
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
	
	public List<Meeting> selectAllMeeting(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("managerMapper.selectAllMeeting");
	}
	
	public List<Chat> selectAllChating(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("managerMapper.selectAllChating");
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
	
	public Member userDetail(SqlSessionTemplate sqlSession, Integer uNo) {
		
		return sqlSession.selectOne("managerMapper.userDetail", uNo);
	}
	
	public ManagerMeeting meetingDetail(SqlSessionTemplate sqlSession, int meetNo) {
		
		return sqlSession.selectOne("managerMapper.meetingDetail", meetNo);
	}
	
	public ManagerChat chatDetail(SqlSessionTemplate sqlSession, int chatNo) {
		
		return sqlSession.selectOne("managerMapper.chatDetail", chatNo);
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

	public ManagerQuestion2 beforeQuestionAnswer(SqlSessionTemplate sqlSession, int qNo) {
		
		return sqlSession.selectOne("managerMapper.beforeQuestionAnswer", qNo);
	}

	public int afterQuestionAnswer(SqlSessionTemplate sqlSession, ManagerQuestion2 m) {
		
		return sqlSession.update("managerMapper.afterQuestionAnswer", m);
	}
	
	public ManagerChat beforeChatUpdate(SqlSessionTemplate sqlSession, int cNo) {
		
		return sqlSession.selectOne("managerMapper.beforeChatUpdate", cNo);
	}

	public ManagerMeeting beforeMeetingUpdate(SqlSessionTemplate sqlSession, int mNo) {
		
		return sqlSession.selectOne("managerMapper.beforeMeetingUpdate", mNo);
	}

	public int afterMeetingUpdate(SqlSessionTemplate sqlSession, ManagerMeeting m) {
		
		return sqlSession.update("managerMapper.afterMeetingUpdate", m);
	}

	public int noticeDelete(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.delete("managerMapper.noticeDelete", noticeNo);
	}

	public int faqDelete(SqlSessionTemplate sqlSession, int faqNo) {
		
		return sqlSession.delete("managerMapper.faqDelete", faqNo);
	}

	public int meetingDelete(SqlSessionTemplate sqlSession, int meetingNo) {
		
		return sqlSession.delete("managerMapper.meetingDelete", meetingNo);
	}

	public int showDelete(SqlSessionTemplate sqlSession, int showNo) {
		
		return sqlSession.delete("managerMapper.showDelete", showNo);
	}

	public int questionDelete(SqlSessionTemplate sqlSession, int questionNo) {
		
		return sqlSession.delete("managerMapper.questionDelete", questionNo);
	}

	public int userDelete(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.delete("managerMapper.userDelete", userNo);
	}

	public int chatDelete(SqlSessionTemplate sqlSession, int chatNo) {
		
		return sqlSession.delete("managerMapper.chatDelete", chatNo);
	}

	public int reservDelete(SqlSessionTemplate sqlSession, int reservId) {
		
		return sqlSession.delete("managerMapper.reservDelete", reservId);
	}

	public int afterChatUpdate(SqlSessionTemplate sqlSession, ManagerChat mc) {
		
		return sqlSession.update("managerMapper.afterChatUpdate", mc);
	}

	public ManagerPageReservation2 beforeReservUpdate(SqlSessionTemplate sqlSession, int reservNo) {
		
		return sqlSession.selectOne("managerMapper.beforeReservUpdate", reservNo);
	}
}
