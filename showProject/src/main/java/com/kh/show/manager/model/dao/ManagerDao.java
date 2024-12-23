package com.kh.show.manager.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.show.manager.model.vo.Manager;

@Repository
public class ManagerDao {

	public Manager loginManager(SqlSessionTemplate sqlSession, Manager m) {
		return sqlSession.selectOne("managerMapper.loginManager",m);
	}

	
	
}
