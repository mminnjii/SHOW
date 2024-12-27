package com.kh.show.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.show.common.template.PageInfo;
import com.kh.show.common.template.Pagenation;
import com.kh.show.customer.model.vo.Question;
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
		
		//System.out.println(bcrtptPasswordEncoder.matches(m.getUserPwd(),loginUser.getUserPwd()));
		
		if(loginUser != null && bcrtptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			//System.out.println("Y");
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", loginUser.getUserName()+"님 환영합니다");
			mv.setViewName("redirect:/");
		}else {
			//System.out.println("N");
			session.setAttribute("alertMsg", "로그인 실패!");
			mv.setViewName("member/loginPage");
		}
		
		return mv;
	}
	
	//로그아웃
	@GetMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	//아이디 찾기
	@PostMapping("findId")
	public String findId(String userName,
						 String email,
						 HttpSession session) {
		HashMap<String, String> map = new HashMap<>();
		map.put("userName",userName);
		map.put("email", email);
		
		String userId = memberService.findId(map);
		
		session.setAttribute("alertMsg", userName+"님의 아이디는 '"+ userId+"'입니다");
		
		return "member/loginPage";
	}
	
	//비밀번호 찾기
	@PostMapping("findPwd")
	public String findPwd(String id,
						  String name,
						  HttpSession session,
						  Model model) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id",id);
		map.put("name", name);
			
		int result = memberService.findPwd(map);
		
		if(result>0) {
			model.addAttribute("map",map);
			return "member/newPwd";
		}else {
			session.setAttribute("alertMsg", "아이디 혹은 이름이 일치하지 않습니다.");
			return "member/loginPage";
		}
	}
	
	//비밀번호 업데이트 메소드
	@PostMapping("newPwd")
	public ModelAndView newPwd(String userPwd,
							   HttpSession session,
							   String userId,
							   ModelAndView mv) {
			String encPwd = bcrtptPasswordEncoder.encode(userPwd);
			
			HashMap<String, String> map = new HashMap<>();
			map.put("userId",userId);
			map.put("encPwd", encPwd);
			
			int result = memberService.updateNewPassword(map);
			
			if(result>0) {
				session.setAttribute("alertMsg", "비밀번호 변경 성공!");
				mv.setViewName("member/loginPage");
			}else {
				session.setAttribute("alertMsg", "비밀번호 변경 실패!");
				mv.setViewName("member/loginPage");
			}
			
			return mv;
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
	@GetMapping("/subscribe")
	public String subscribe() {
		
		return "member/subscribe";
	}
	@GetMapping("/group")
	public String group() {
		
		return "member/myGroup";
	}
	@GetMapping("/chat")
	public String chat() {
		
		return "member/myChat";
	}
	
	@GetMapping("/payment")
	public String payment() {
		
		return "member/myPayment";
	}
	
	//회원 정보 업데이트 메소드
	@PostMapping("update.me")
	public ModelAndView updateMember(Member m,
									 MultipartFile upfile,
									 HttpSession session,
									 ModelAndView mv) {
		
		//삭제 할 파일명 저장 변수
		String deleteFile = null;
		
		if(!upfile.getOriginalFilename().equals("")) {
			//기존 첨부파일이 서버에 업로드 되어있는 파일명 저장
			if(m.getOriginName()!=null) {
				//삭제할 기존 파일명 저장
				deleteFile = m.getChangeName();
			}
			
			//새로 업로드된 파일 정보 데이터베이스 등록 및 파일 서버 업로드 처리
			String changeName = saveFile(upfile,session);
			
			//업로드 처리 후 변경된 파일명 데이터베이스에 등록하기 위해 m에 세팅
			m.setOriginName(upfile.getOriginalFilename());//원본 파일명
			m.setChangeName(changeName);//서버 업로드 파일명
			
		}
		
		int result = memberService.updateMember(m);
		
		if(result>0) {
			//기존 파일이 있을 시 삭제
			if(deleteFile != null) {
				new File(session.getServletContext().getRealPath("/resources/profile/"+deleteFile)).delete();
			}
			Member loginUser = memberService.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("member/myPage");
		}else {
			mv.setViewName("member/memberUpdate");
		}
		
		return mv;
	}
	
	//파일 업로드 처리 메소드
	private String saveFile(MultipartFile upfile, HttpSession session) {
		
		//1.원본 파일명 추출
		String originName = upfile.getOriginalFilename();
		//2.시간 형식 문자열로 만들기
		String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
		//3.확장자 추출
		String ext = originName.substring(originName.lastIndexOf("."));
		//4.랜덤값 5자리
		int ranNum = (int)(Math.random()*90000+10000);
		//5.합치기
		String changeName = currentTime+ranNum+ext;
		//6.업로드하고자 하는 서버의 물리적인 경로 찾아내기
		String savePath = session.getServletContext().getRealPath("/resources/profile/");
		//7.경로와 수정파일명 합쳐서 파일 업로드 처리
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
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
	
	//비밀번호 확인 메소드
	@ResponseBody
	@RequestMapping(value="/pwdCheck", produces="text/html;charset=UTF-8")
	public String pwdCheck(String checkPwd,
						   String userId) {
		
		String pwd = memberService.memberPwd(userId);
		
		String val = "";
		
		if(bcrtptPasswordEncoder.matches(checkPwd, pwd)) {
			val = "YYY";
		}else {
			val = "NNN";
		}
		
		return val;
	}
	
	//비밀번호 업데이트 메소드
	@PostMapping("password.me")
	public ModelAndView updatePassword(Member m,
									   HttpSession session,
									   ModelAndView mv) {
		String encPwd = bcrtptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.updatePassword(m);
		
		if(result>0) {
			Member loginUser = memberService.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "비밀번호 변경 성공!");
			mv.setViewName("member/myPage");
		}else {
			session.setAttribute("alertMsg", "비밀번호 변경 실패!");
			mv.setViewName("member/myPage");
		}
		
		return mv;
	}
	
	//회원 탈퇴 메소드
	@PostMapping("delete.me")
	public String deleteMember(String userPwd,
							   HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(bcrtptPasswordEncoder.matches(userPwd, loginUser.getUserPwd())) {
			int result = memberService.deleteMember(loginUser.getUserId());
			if(result>0) {
				session.removeAttribute("loginUser");
				return "member/deletePage";
			}else {
				session.setAttribute("alertMsg", "회원 탈퇴 실패!");
				return "member/deleteMember";
			}
		}else {
			return "member/deleteMember";
		}
	}
								
	//회원 등급 페이지로
	@GetMapping("/rank")
	public String rank() {
		
		return "member/memberRank";
	}
	
	//구독 시작 메소드
	@PostMapping("/subscribe.me")
	public String startSub(String userId,
						   Member m,
			  			   HttpSession session) {	
		
		int result = memberService.startSub(userId);
		
		System.out.println(m);
		
		System.out.println(result);
		
		if(result>0) {
			Member loginUser = memberService.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "구독 시작!");
		}
		
		return "member/subscribe";
	}
	

	
	//qna 리스트 메소드
	@GetMapping("/qna")
	public String qna(@RequestParam(value="currentPage",defaultValue="1")
					  int currentPage,
					  Model model,
					  int userNo) {
		
		int listCount = memberService.listCount(userNo);
		int pageLimit = 10;
		int listLimit = 5;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, listLimit);
		
		ArrayList<Question> list = memberService.qnaList(userNo,pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		System.out.println(list);
		System.out.println(pi);
		
		return "member/myQna";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
