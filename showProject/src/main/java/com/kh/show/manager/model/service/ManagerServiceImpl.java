package com.kh.show.manager.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.show.manager.model.dao.ManagerDao;
import com.kh.show.manager.model.vo.Manager;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagerDao dao;
	
	@Override
	public Manager loginManager(Manager m) {
		return dao.loginManager(sqlSession, m);
	}
	
//	@Override
//	public List<notice> getNotice() {
//		return dao.loginManager(sqlSession);
//	}
	
}
