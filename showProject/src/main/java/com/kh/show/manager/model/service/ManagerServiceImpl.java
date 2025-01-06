package com.kh.show.manager.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.customer.model.vo.Faq;
import com.kh.show.customer.model.vo.ManagerQuestion;
import com.kh.show.manager.model.dao.ManagerDao;
import com.kh.show.manager.model.vo.Manager;
import com.kh.show.member.model.vo.Member;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.reservation.model.vo.ManagerPageReservation2;
import com.kh.show.reservation.model.vo.Reservation;
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
		String posterChangeName = genreName+"_"+regionName+"_"+show.getShowName()+show.getShowNo()+"P";
		String detailChangeName = genreName+"_"+regionName+"_"+show.getShowName()+show.getShowNo()+"D";
		show.setPosterChangeName(posterChangeName);
		show.setDetailChangeName(detailChangeName);
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
	public List<Show> selectAllShow() {

		return dao.selectAllShow(sqlSession);
	}
	
	@Override
	public List<ManagerQuestion> selectAllQuestion() {
		
		return dao.selectAllQuestion(sqlSession);
	}

	@Override
	public List<Notice> updateNoticeInform(Long noticeNo) {

		return dao.updateNoticeInform(sqlSession, noticeNo);
	}

	@Override
	public Faq updateFaq() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Show updateShow() {
		// TODO Auto-generated method stub
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
	public Show showDetail(int showNo) {

		return dao.showDetail(sqlSession, showNo);
	}

	@Override
	public ManagerPageReservation2 reservDetail(int reservNo) {

		return dao.reservDetail(sqlSession, reservNo);
	}

	
	
}
