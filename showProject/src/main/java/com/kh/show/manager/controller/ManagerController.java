package com.kh.show.manager.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.show.manager.model.service.ManagerService;
import com.kh.show.manager.model.vo.Manager;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService service;
	
	@GetMapping("/mLogin")
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
}
