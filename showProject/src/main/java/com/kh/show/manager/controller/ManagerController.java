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
											   HttpSession session,
											   RedirectAttributes redirectAttributes) {
		
		
		// 2. BCryptPasswordEncoder 인스턴스 생성
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		// 3. 비밀번호 암호화
		String encodedManagerPassword = passwordEncoder.encode(m.getManagerPw());

		// 4. 암호화된 결과 출력
		System.out.println("암호화된 비밀번호 : " + encodedManagerPassword);

		// 5. 입력값과 암호화된 값 검증 (예: 로그인 시 검증)
//		boolean isMatch = passwordEncoder.matches(m.getManagerPw(), encodedManagerPassword);
		
		Manager loginManager = service.loginManager(m);
		
		if(loginManager != null) {
			boolean isMatch = passwordEncoder.matches(m.getManagerPw(), encodedManagerPassword);
			System.out.println("비밀번호 검증 결과: " + isMatch);
			
			if (isMatch == true) {
	            session.setAttribute("loginManager", loginManager);
	            session.setAttribute("alertMsg", "환영합니다, 관리자님.");
	            System.out.println("로그인 성공 메시지 전송 완료");
	            return "redirect:/";
        		} else {
        			session.setAttribute("alertMsg", "아이디나 비밀번호를 확인해주세요.");
        			System.out.println("비밀번호 검증 실패");
        			return "redirect:/mLogin";
        		}
		}else {
	        session.setAttribute("alertMsg", "아이디나 비밀번호를 확인해주세요.");
	        System.out.println("로그인 실패 메시지 전송 완료");
	        return "redirect:/mLogin";
	    }
	}
	
	@RequestMapping("/managerLogout")
	public String logoutManager(HttpSession session) {
		
		session.removeAttribute("loginManager");
		session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		
		return "redirect:/";
		
	}
}
