package com.kh.show.manager.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.show.manager.model.service.ManagerService;
import com.kh.show.manager.model.vo.Manager;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService service;
//	private Notice notice;
	
	@GetMapping("/managerLogin")
	public String moveLoginManager() {
		return "manager/managerLogin";
	}
	
	@PostMapping("/managerLogin")
	public String loginManager(@ModelAttribute Manager m,
											   HttpSession session) {
		
		Manager loginManager = service.loginManager(m);
			
			if (loginManager != null) {
	            session.setAttribute("loginManager", loginManager);
	            session.setAttribute("alertMsg", "환영합니다, 관리자님.");
	            return "redirect:/";
        		}else {
	        session.setAttribute("alertMsg", "아이디나 비밀번호를 확인해주세요.");
	        return "redirect:/mLogin";
	    }
	}
	
	@RequestMapping("/managerLogout")
	public String logoutManager(HttpSession session) {
		
		session.removeAttribute("loginManager");
		session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		
		return "redirect:/";	
	}
	
	@RequestMapping("/managerPage")
	public String managerInfo() {
		return "manager/managerPage";
	}
	
	@GetMapping("/noticeInsert")
	public String moveNoticeInsert() {
		return "manager/noticeInsert";
	}
	
	/*
	@PostMapping("/noticeInsert")
	public int noticeInsert(@ModelAttribute notice n,
											HttpSession session) {
		notice n = service.insertNotice(n);
		
		return n;
	}
	*/						// 공지사항 등록
	
	/*
	@RequestMapping("/noticeList")
	public String noticeList(@ModelAttribute notice notice) {
		
		List<notice> notice = service.selectNotice();
		
		return null;
	}
	*/						// 공지사항 리스트 가져오기
	
	/*
	@RequestMapping("/noticeUpdate")
	public String noticeList(@ModelAttribute notice n)
		notice n = service.updateNotice(n);
		
		return n;
	*/
	
	/*
	@RequestMapping("/noticeDelete")
	public String noticeDelete(@ModelAttribute notice n)
		notice n = service.deleteNotice(n);
		
		return n;
	 */
}
