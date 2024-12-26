package com.kh.show.manager.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.manager.model.vo.Manager;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.showInfo.model.vo.Show;

@Repository
public class ManagerDao {

	public Manager loginManager(SqlSessionTemplate sqlSession, Manager m) {
		return sqlSession.selectOne("managerMapper.loginManager",m);
	}

	public List<Notice> selectNotice(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("managerMapper.selectList");
	}

	public int showInsert(SqlSessionTemplate sqlSession, Show show) {
		
		return sqlSession.insert("managerMapper.showInsert", show);
	}

	public int noticeInsert(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("managerMapper.insertNotice", n);
	}

	

	
	
}
