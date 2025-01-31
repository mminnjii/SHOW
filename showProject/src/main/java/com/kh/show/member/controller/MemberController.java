package com.kh.show.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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

import com.google.gson.Gson;
import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ChatJoin;
import com.kh.show.common.template.PageInfo;
import com.kh.show.common.template.Pagenation;
import com.kh.show.customer.model.vo.Question;
import com.kh.show.meeting.model.vo.Meeting;
import com.kh.show.meeting.model.vo.MeetingJoin;
import com.kh.show.member.model.service.MemberService;
import com.kh.show.member.model.vo.Coupon;
import com.kh.show.member.model.vo.Member;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.showInfo.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcrtptPasswordEncoder;
	
	//로그인 페이지로 이동
	@GetMapping("/toLogin")
	public String toLogin() {
		
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
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", loginUser.getUserName()+"님 환영합니다");
			mv.setViewName("redirect:/");
		}else {
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
		
		if(userId == null) {
			session.setAttribute("alertMsg", "존재하지 않는 회원 이거나, 이름 또는 이메일이 일치하지 않습니다.");
		}else {
			session.setAttribute("alertMsg", userName+"님의 아이디는 '"+ userId+"'입니다");
		}
		
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
	
	//전화번호 중복 확인
	@ResponseBody
	@RequestMapping(value="/phoneCheck", produces="text/html;charset=UTF-8")
	public String phoneCheck(String phone) {
			
		int result = memberService.phoneCheck(phone);
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
		System.out.println(userPwd);
		
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
						   int userNo,
						   Member m,
			  			   HttpSession session) {	
		
		int result = memberService.startSub(userId);
		
		if(result>0) {
			Member loginUser = memberService.loginMember(m);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "구독 시작!");
		}else {
			session.setAttribute("alertMsg", "결제 오류");
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
		
		return "member/myQna";
	}
	
	//리뷰 리스트 메소드
	@GetMapping("/review")
	public String myReview(@RequestParam(value="currentPage",defaultValue="1")
					   		int currentPage,
					   		Model model,
					   		int userNo) {
		int listCount = memberService.rListCount(userNo);
		int pageLimit = 10;
		int listLimit = 5;
			
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, listLimit);
			
		ArrayList<Review> rlist = memberService.reviewList(userNo,pi);

		model.addAttribute("rlist",rlist);
		model.addAttribute("pi",pi);
			
		return "member/myReview";
	}

	//리뷰 리스트 메소드
	@GetMapping("/show")
	public String myShow(@RequestParam(value="currentPage",defaultValue="1")
						 int currentPage,
						 Model model,
						 int userNo) {
		int listCount = memberService.sListCount(userNo);
		int pageLimit = 10;
		int listLimit = 5;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, listLimit);
				
		ArrayList<Reservation> slist = memberService.showList(userNo,pi);
		model.addAttribute("slist",slist);
		model.addAttribute("pi",pi);
		
		return "member/myShow";
	}
	
	//리뷰 리스트 메소드
	@GetMapping("/payment")
	public String payment(@RequestParam(value="currentPage",defaultValue="1")
						  int currentPage,
						  Model model,
						  int userNo) {
		int listCount = memberService.pListCount(userNo);
		int pageLimit = 10;
		int listLimit = 5;
			
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, listLimit);
					
		ArrayList<Reservation> plist = memberService.payList(userNo,pi);

		model.addAttribute("plist",plist);
		model.addAttribute("pi",pi);
			
		return "member/myPayment";
	}
	
	//메인페이지 쿠폰 수, 리뷰 수, 공연 수

	@ResponseBody
	@RequestMapping(value="couponCount")
	public int couponCount(int userNo) {
		int cno = memberService.couponCount(userNo);
		
		return cno;
	}
	@ResponseBody
	@RequestMapping(value="reviewCount")
	public int reviewCount(int userNo) {
		int rno = memberService.rListCount(userNo);
		
		return rno;
	}
	@ResponseBody
	@RequestMapping(value="showCount")
	public int showCount(int userNo) {
		int sno = memberService.sListCount(userNo);
		
		return sno;
	}
	
	@ResponseBody
	@RequestMapping(value="couponList",produces="application/json;charset=UTF-8")
	public String couponList(int userNo) {

		ArrayList<Coupon> clist = memberService.couponList(userNo);
		return new Gson().toJson(clist);
	}
	
	//예약 확인/취소 페이지로 이동
	@RequestMapping("reserve")
	public String reserve(@RequestParam(value="currentPage",defaultValue="1")
						  int currentPage,
						  Model model,
						  int userNo) {
		int listCount = memberService.reserveCount(userNo);
		int pageLimit = 10;
		int listLimit = 5;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, listLimit);
		
		ArrayList<Reservation> rlist = memberService.reserveList(userNo,pi);
		
		model.addAttribute("rlist",rlist);
		model.addAttribute("pi",pi);
		
		return "reservation/reservePage";
	}
	
	//예약 취소
	@PostMapping("cancelRes")
	public String cancleRes(String reservationId,
							int userNo,
							int seatId,
							HttpSession session) {
		int result = memberService.cancelRes(reservationId);
		int result2 = memberService.cancelTicket(reservationId);
		int result3 = memberService.cancelPay(reservationId);
		int result4 = memberService.rollbackSeats(seatId);
		
		if(result>0 && result2>0 && result3>0 && result4>0) {
			session.setAttribute("alertMsg", "예약 취소 성공!");
		}else {
			session.setAttribute("alertMsg", "예약 취소 실패!");
		}
		return "redirect:/member/reserve?userNo="+userNo;
	}
	
	//내가 가입한 채팅방
	@GetMapping("/chat")
	public String chat(@RequestParam(value="currentPage",defaultValue="1")
					  int currentPage,
					  Model model,
					  int userNo) {
		int listCount = memberService.chatCount(userNo);
		int pageLimit = 10;
		int listLimit = 5;

		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, listLimit);
		
		ArrayList<ChatJoin> clist = memberService.chatList(userNo,pi);
		
		model.addAttribute("clist",clist);
		model.addAttribute("pi",pi);
		return "member/myChatJoin";
	}
	
	//내가 생성한 채팅방
	@GetMapping("/chat2")
	public String chat2(@RequestParam(value="currentPage",defaultValue="1")
					    int currentPage,
					    Model model,
					    int userNo) {
		int listCount = memberService.chatCount2(userNo);
		int pageLimit = 10;
		int listLimit = 5;

		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, listLimit);
		
		ArrayList<Chat> c2list = memberService.chatList2(userNo,pi);

		model.addAttribute("c2list",c2list);
		model.addAttribute("pi",pi);
		
		return "member/myChatHost";
	}
	
	@GetMapping("/group")
	public String meeting(@RequestParam(value="currentPage",defaultValue="1")
					    int currentPage,
					    Model model,
					    int userNo) {
		int listCount = memberService.meetingCount(userNo);
		int pageLimit = 10;
		int listLimit = 5;
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, listLimit);
					
		ArrayList<MeetingJoin> mlist = memberService.meetingList(userNo,pi);

		model.addAttribute("mlist",mlist);
		model.addAttribute("pi",pi);
		return "member/myGroupJoin";
	}
	
	@GetMapping("/group2")
	public String meeting2(@RequestParam(value="currentPage",defaultValue="1")
					    	int currentPage,
					    	Model model,
					    	int userNo) {
		int listCount = memberService.meetingCount2(userNo);
		int pageLimit = 10;
		int listLimit = 5;
		PageInfo pi = Pagenation.getPageInfo(listCount, currentPage, pageLimit, listLimit);
					
		ArrayList<Meeting> m2list = memberService.meetingList2(userNo,pi);
		
		model.addAttribute("m2list",m2list);
		model.addAttribute("pi",pi);

		return "member/myGroupHost";
	}	
	
	//naver관련
	@GetMapping("naver")
	public String loginPOSTNaver(HttpSession session) {
	   log.info("callback controller");
	   return "member/callback";
	}
	
	@GetMapping("cancelSub")
	public String cancelSub(int userNo,
						    HttpSession session) {
		int result = memberService.cancelSub(userNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "취소 성공! 로그아웃 후 확인 가능합니다.");
		}else {
			session.setAttribute("alertMsg", "취소 실패!");
		}
		return "redirect:/member/myPage";
	}
	
	
	
	
}
