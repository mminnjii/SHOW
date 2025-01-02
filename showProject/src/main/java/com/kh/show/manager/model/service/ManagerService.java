package com.kh.show.manager.model.service;

import java.util.List;

import com.kh.show.customer.model.vo.Faq;
import com.kh.show.manager.model.vo.Manager;
import com.kh.show.member.model.vo.Member;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.reservation.model.vo.Reservation;
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
    List<Show> selectAllShow();

//	공지사항 수정하기
	List<Notice> updateNoticeInform(Long noticeNo);
	
//	FAQ 수정하기
	Faq updateFaq();
	
//	공연 수정하기
	Show updateShow();

	int insertFaq(Faq f);

	
	
}
