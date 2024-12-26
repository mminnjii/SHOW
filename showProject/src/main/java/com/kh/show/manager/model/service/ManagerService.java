package com.kh.show.manager.model.service;

import java.util.List;

import com.kh.show.manager.model.vo.Manager;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.showInfo.model.vo.Show;

public interface ManagerService {

	Manager loginManager(Manager m);

	List<Notice> selectNotice();

	int showInsert(Show show);

	int noticeInsert(Notice n);

	
	
}
