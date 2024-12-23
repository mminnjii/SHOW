package com.kh.show.showInfo.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.showInfo.model.dao.ShowInfoDao;
import com.kh.show.showInfo.model.vo.Show;

@Service
public class ShowInfoImpl implements ShowInfoService {

	@Autowired
	private ShowInfoDao showInfoDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
@Override
public ArrayList<Show> musicalShow() {
	
	ArrayList<Show> musicalShowList = showInfoDao.musicalShow(sqlSession);
	
	
	return musicalShowList;
}
}
