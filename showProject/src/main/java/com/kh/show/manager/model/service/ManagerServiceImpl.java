package com.kh.show.manager.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.manager.model.dao.ManagerDao;
import com.kh.show.manager.model.vo.Manager;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.showInfo.model.vo.Show;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagerDao dao;
	
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

    // 지역 번호에 맞는 지역 이름을 반환
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
	
	@Override
	public Manager loginManager(Manager m) {
		
		return dao.loginManager(sqlSession, m);
	}

	@Override
	public List<Notice> selectNotice() {

		return dao.selectNotice(sqlSession);
	}

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
	
	@Override
	public int noticeInsert(Notice n) {
		
		return dao.noticeInsert(sqlSession, n);
	}

	
}
