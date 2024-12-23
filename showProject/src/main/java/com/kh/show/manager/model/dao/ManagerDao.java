package com.kh.show.manager.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.manager.model.vo.Manager;

@Repository
public class ManagerDao {

	public Manager loginManager(SqlSessionTemplate sqlSession, Manager m) {
		return sqlSession.selectOne("managerMapper.loginManager",m);
	}

//	public List<notice> loginManager(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectList("managerMapper.selectNotice");
//	}

	
	
}
