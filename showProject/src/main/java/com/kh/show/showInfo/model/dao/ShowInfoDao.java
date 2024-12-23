package com.kh.show.showInfo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.showInfo.model.vo.Show;

@Repository
public class ShowInfoDao {

	public ArrayList<Show> musicalShow(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("showInfoMapper.musicalShowList");
	}

}
