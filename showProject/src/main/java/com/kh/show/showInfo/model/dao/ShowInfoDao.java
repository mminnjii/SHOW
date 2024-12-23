package com.kh.show.showInfo.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.show.showInfo.model.vo.Show;

@Repository
public class ShowInfoDao {

	
	
	// 공연상세정보조회
	public Show selectShow(SqlSession session) {
	
		Show s = session.selectOne("showInfoMapper.selectShow");
		return s;
	}
	
	
}
