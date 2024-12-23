package com.kh.show.member.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@GetMapping("/memberEnrollPage")
	public String memberEnrollPage() {
		
		log.info("회원 정보 입력");
		
		return "member/memberEnrollPage";
	}

	
	//회원가입 메소드
	@PostMapping("insert.me")
	public String insertMember(Member m,
							   HttpSession session) {
		
		String encPwd = bcrtptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입 성공!");
			return "member/enrollSuccess";
		}else{
			session.setAttribute("alertMsg", "회원가입 실패! 홈페이지로 이동합니다");
			return "redirect:/";
		}
	}
	
	//아이디 중복 확인
	@ResponseBody
	@RequestMapping(value="/idCheck", produces="text/html;charset=UTF-8")
	public String idCheck(String checkId) {
		
		int result = memberService.idCheck(checkId);
		
		String val = "";
		
		if(result>0) {
			val = "NNN";
		}else {
			val = "YYY";
		}
		
		return val;
	}
	
	//마이페이지로 이동
	@GetMapping("/myPage")
	public String myPage() {
		
		log.info("마이페이지");
		
		return "member/myPage";
	}
	@GetMapping("/memberUpdate")
	public String memberUpdate() {
		
		return "member/memberUpdate";
	}
	@GetMapping("/address")
	public String address() {
		
		return "member/memberAddress";
	}
	@GetMapping("/password")
	public String password() {
		
		return "member/passUpdate";
	}
	@GetMapping("/delete")
	public String delete() {
		
		return "member/deleteMember";
	}
	
	//회원 정보 업데이트 메소드
	@PostMapping("update.me")
	public ModelAndView updateMember(Member m,
									 HttpSession session,
									 ModelAndView mv) {
		int result = memberService.updateMember(m);
		
		if(result>0) {
			Member loginUser = memberService.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("member/myPage");
		}
		
		return mv;
	}
	
	//회원 배송지 추가
	@PostMapping("/address.me")
	public String memberAddress(String userId,
								String address,
								Member m,
								HttpSession session) {	
		HashMap<String,String> map = new HashMap<>();
		map.put("userId",userId);
		map.put("address", address);
		
		int result =  memberService.memberAddress(map);
		
		if(result>0) {
			Member loginUser = memberService.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "변경 성공!");
		}
		
		return "member/memberAddress";
	}
	
								
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
