package com.kh.show.manager.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ManagerChat;
import com.kh.show.customer.model.vo.Faq;
import com.kh.show.customer.model.vo.ManagerQuestion;
import com.kh.show.customer.model.vo.ManagerQuestion2;
import com.kh.show.manager.model.dao.ManagerDao;
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

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagerDao dao;
	
//	공연 작성 관련 switch문
//	장르 번호에 맞는 장르 이름을 반환
    private String getGenreName(int genreNo) {
        switch (genreNo) {
            case 1: return "뮤지컬";
            case 2: return "연극";
            case 3: return "콘서트";
            case 4: return "클래식";
            case 5: return "전시";
            default: return "알 수 없음";
        }
    }

//  지역 번호에 맞는 지역 이름을 반환
    private String getRegionName(int regionNo) {
        switch (regionNo) {
            case 1: return "서울";
            case 2: return "경기/인천";
            case 3: return "충청/강원";
            case 4: return "대구/경북";
            case 5: return "부산/경남";
            case 6: return "광주/전라";
            case 7: return "제주";
            default: return "알 수 없음";
        }
    }
    
//	관리자 로그인
	@Override
	public Manager loginManager(Manager m) {
		
		return dao.loginManager(sqlSession, m);
	}
	
//	공연 작성
	@Override
	public int showInsert(Show show) {

		String genreName = getGenreName(show.getGenreNo());
		String regionName = getRegionName(show.getRegionNo());
		/*
		String posterChangeName = genreName+"_"+regionName+"_"+show.getShowName()+show.getShowNo()+"P";
		String detailChangeName = genreName+"_"+regionName+"_"+show.getShowName()+show.getShowNo()+"D";
		show.setPosterChangeName(posterChangeName);
		show.setDetailChangeName(detailChangeName);
		*/
		return dao.showInsert(sqlSession, show);
	}
	
//	공지사항 작성
	@Override
	public int noticeInsert(Notice n) {
		
		return dao.noticeInsert(sqlSession, n);
	}

//	공지사항 불러오기
	@Override
	public List<Notice> selectAllNotice() {

		return dao.selectAllNotice(sqlSession);
	}

//	FAQ 불러오기
	@Override
	public List<Faq> selectAllFaq() {

		return dao.selectAllFaq(sqlSession);
	}

//	회원 불러오기
	@Override
	public List<Member> selectAllMember() {

		return dao.selectAllMember(sqlSession);
	}

//	예약 불러오기
	@Override
	public List<Reservation> selectAllReserv() {

		return dao.selectAllReserv(sqlSession);
	}

//	공연 불러오기
	@Override
	public List<ManagerShowInfo> selectAllShow() {

		return dao.selectAllShow(sqlSession);
	}
	
//	1:1 문의 가져오기
	@Override
	public List<ManagerQuestion> selectAllQuestion() {

		return dao.selectAllQuestion(sqlSession);
	}
	
//	소모임 가져오기
	@Override
	public List<Meeting> selectAllMeeting() {
		
		return dao.selectAllMeeting(sqlSession);
	}
	
//	채팅 가져오기
	@Override
	public List<Chat> selectAllChating() {

		return dao.selectAllChating(sqlSession);
	}

	@Override
	public List<Notice> updateNoticeInform(Long noticeNo) {

		return dao.updateNoticeInform(sqlSession, noticeNo);
	}

	@Override
	public Faq updateFaq() {

		return null;
	}

	@Override
	public Show updateShow() {

		return null;
	}
	
	@Override
	public int insertFaq(Faq f) {

		return dao.insertFaq(sqlSession, f);
	}

	@Override
	public Notice noticeDetail(int noticeNo) {

		return dao.noticeDetail(sqlSession, noticeNo);
	}

	@Override
	public Faq faqDetail(int faqNo) {

		return dao.faqDetail(sqlSession, faqNo);
	}

	@Override
	public ManagerShowInfo2 showDetail(int showNo) {

		return dao.showDetail(sqlSession, showNo);
	}

	@Override
	public ManagerPageReservation2 reservDetail(int reservNo) {

		return dao.reservDetail(sqlSession, reservNo);
	}
	
	@Override
	public ManagerQuestion2 questionDetail(int qNo) {

		return dao.questionDetail(sqlSession, qNo);
	}
	
	@Override
	public Member userDetail(Integer uNo) {

		return dao.userDetail(sqlSession, uNo);
	}
	
	@Override
	public ManagerMeeting meetingDetail(int meetNo) {
		
		return dao.meetingDetail(sqlSession, meetNo);
	}
	
	@Override
	public ManagerChat chatDetail(int chatNo) {
		
		return dao.chatDetail(sqlSession, chatNo);
	}

	@Override
	public Notice beforeNoticeUpdate(int noticeNo) {
		
		return dao.beforeNoticeUpdate(sqlSession, noticeNo);
	}
	
	@Override
	public int afterNoticeUpdate(Notice notice) {
		
		return dao.afterNoticeUpdate(sqlSession, notice);
	}
	
	@Override
	public Faq beforeFaqUpdate(int faqNo) {
		
		return dao.beforeFaqUpdate(sqlSession, faqNo);
	}
	
	@Override
	public int afterFaqUpdate(Faq faq) {

		return dao.afterFaqUpdate(sqlSession, faq);
	}
	
	@Override
	public Member beforeUserUpdate(int userNo) {
		
		return dao.beforeUserUpdate(sqlSession, userNo);
	}
	
	@Override
	public int afterUserUpdate(Member m) {

		return dao.afterUserUpdate(sqlSession, m);
	}
	
	@Override
	public ManagerUpdateShow beforeShowUpdate(int showNo) {
		
		return dao.beforeShowUpdate(sqlSession, showNo);
	}
	
	@Override
	public int afterShowUpdate(Show show) {
		
		return dao.afterShowUpdate(sqlSession, show);
	}
	
	@Override
	public ManagerQuestion2 beforeQuestionAnswer(int qNo) {
		
		return dao.beforeQuestionAnswer(sqlSession, qNo);
	}
	
	@Override
	public int afterQuestionAnswer(ManagerQuestion2 m) {

		return dao.afterQuestionAnswer(sqlSession, m);
	}
	
	@Override
	public ManagerChat beforeChatUpdate(int cNo) {
		
		return dao.beforeChatUpdate(sqlSession, cNo);
	}
	
	@Override
	public ManagerMeeting beforeMeetingUpdate(int mNo) {
		
		return dao.beforeMeetingUpdate(sqlSession, mNo);
	}
	
	@Override
	public int afterMeetingUpdate(ManagerMeeting m) {

		return dao.afterMeetingUpdate(sqlSession, m);
	}
	
	@Override
	public int noticeDelete(int noticeNo) {
		
		return dao.noticeDelete(sqlSession, noticeNo);
	}
	
	@Override
	public int faqDelete(int faqNo) {
		
		return dao.faqDelete(sqlSession, faqNo);
	}
	
	@Override
	public int meetingDelete(int meetingNo) {
		
		return dao.meetingDelete(sqlSession, meetingNo);
	}
	
	@Override
	public int showDelete(int showNo) {
		
		return dao.showDelete(sqlSession, showNo);
	}
	
	@Override
	public int questionDelete(int questionNo) {
		
		return dao.questionDelete(sqlSession, questionNo);
	}
	
	@Override
	public int userDelete(int userNo) {
		
		return dao.userDelete(sqlSession, userNo);
	}
	
	@Override
	public int chatDelete(int chatNo) {
		
		return dao.chatDelete(sqlSession, chatNo);
	}
	
	@Override
	public int reservDelete(int reservId) {
		
		return dao.reservDelete(sqlSession, reservId);
	}
	
	@Override
	public int afterChatUpdate(ManagerChat mc) {

		return dao.afterChatUpdate(sqlSession, mc);
	}
	
	@Override
	public ManagerPageReservation2 beforeReservUpdate(int reservNo) {
		
		return dao.beforeReservUpdate(sqlSession, reservNo);
	}
}
