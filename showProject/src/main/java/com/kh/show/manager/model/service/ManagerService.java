package com.kh.show.manager.model.service;

import java.util.List;

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

public interface ManagerService {

//	관리자 로그인
	Manager loginManager(Manager m);

//	공연 작성
	int showInsert(Show show);

//	공지사항 작성
	int noticeInsert(Notice n);
	
//	공지사항 불러오기
	List<Notice> selectAllNotice();
	
//	FAQ 불러오기
    List<Faq> selectAllFaq();
    
//	회원 불러오기
    List<Member> selectAllMember();
    
//	예약 불러오기
    List<Reservation> selectAllReserv();
    
//	공연 불러오기
    List<ManagerShowInfo> selectAllShow();
    
//  1:1 문의 목록 가져오기
    List<ManagerQuestion> selectAllQuestion();
    
//  소모임 목록 가져오기
	List<Meeting> selectAllMeeting();
	
//	채팅 목록 가져오기
	List<Chat> selectAllChating();

//	공지사항 수정하기
	List<Notice> updateNoticeInform(Long noticeNo);
	
//	FAQ 수정하기
	Faq updateFaq();
	
//	공연 수정하기
	Show updateShow();

	int insertFaq(Faq f);

	Notice noticeDetail(int noticeNo);

	Faq faqDetail(int faqNo);

	ManagerShowInfo2 showDetail(int showNo);

	ManagerPageReservation2 reservDetail(int reservNo);

	ManagerQuestion2 questionDetail(int qNo);
	
	Member userDetail(Integer uNo);
	
	ManagerMeeting meetingDetail(int meetNo);
	
	ManagerChat chatDetail(int chatNo);

	Notice beforeNoticeUpdate(int noticeNo);

	int afterNoticeUpdate(Notice notice);

	Faq beforeFaqUpdate(int faqNo);

	int afterFaqUpdate(Faq faq);

	Member beforeUserUpdate(int userNo);

	int afterUserUpdate(Member m);

	ManagerUpdateShow beforeShowUpdate(int showNo);

	int afterShowUpdate(Show show);

	ManagerQuestion2 beforeQuestionAnswer(int qNo);

	int afterQuestionAnswer(ManagerQuestion2 m);

	ManagerMeeting beforeMeetingUpdate(int mNo);

	int afterMeetingUpdate(ManagerMeeting m);

	int noticeDelete(int noticeNo);

	int faqDelete(int faqNo);

	int meetingDelete(int meetingNo);

	int showDelete(int showNo);

	int questionDelete(int questionNo);

	int userDelete(int userNo);

	int chatDelete(int chatNo);

	int reservDelete(int reservId);

	ManagerChat beforeChatUpdate(int cNo);

	int afterChatUpdate(ManagerChat mc);

	ManagerPageReservation2 beforeReservUpdate(int reservNo);
}
