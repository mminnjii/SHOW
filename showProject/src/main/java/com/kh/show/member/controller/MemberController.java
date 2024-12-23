package com.kh.show.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.show.member.model.service.MemberService;
import com.kh.show.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcrtptPasswordEncoder;
	
	//로그인 페이지로 이동
	@GetMapping("/toLogin")
	public String toLogin() {
		
		log.info("로그인 페이지");
		
		return "member/loginPage";
	}
	//로그인 메소드 & 암호화
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,
									String saveId,
									HttpSession session,
									ModelAndView mv,
									HttpServletResponse response) {
		
		Cookie cookie;
		
		if(saveId != null) {//체크됨
			cookie = new Cookie("userId", m.getUserId());
			cookie.setMaxAge(60*60*24*7);//일주일
			response.addCookie(cookie);
		}else {//체크 안 됨
			cookie = new Cookie("userId", null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		
		Member loginUser = memberService.loginMember(m);
		
		System.out.println(loginUser);
		
		//System.out.println(bcrtptPasswordEncoder.matches(m.getUserPwd(),loginUser.getUserPwd()));
		
		if(loginUser != null && bcrtptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			//System.out.println("Y");
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", loginUser.getUserName()+"님 환영합니다");
			mv.setViewName("redirect:/");
		}else {
			//System.out.println("N");
			session.setAttribute("alertMsg", "로그인 실패!");
			mv.setViewName("redirect:/");
		}
		
		return mv;
	}
	
	//로그아웃
	@GetMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	//회원가입 페이지로
	@GetMapping("/toEnroll")
	public String toEnroll() {
		
		log.info("회원가입 페이지");
		
		return "member/enrollPage";
	}
	@GetMapping("/toTOS")
	public String toTOS() {
		
		log.info("회원가입 페이지");
		
		return "member/enrollTOS";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
