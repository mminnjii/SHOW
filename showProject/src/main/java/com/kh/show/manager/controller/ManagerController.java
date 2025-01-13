package com.kh.show.manager.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.show.chat.model.vo.Chat;
import com.kh.show.chat.model.vo.ManagerChat;
import com.kh.show.customer.model.vo.Faq;
import com.kh.show.customer.model.vo.ManagerQuestion;
import com.kh.show.customer.model.vo.ManagerQuestion2;
import com.kh.show.manager.model.service.ManagerService;
import com.kh.show.manager.model.vo.Manager;
import com.kh.show.meeting.model.vo.ManagerMeeting;
import com.kh.show.meeting.model.vo.Meeting;
import com.kh.show.member.model.vo.Member;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.reservation.model.vo.ManagerPageReservation2;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.showInfo.model.vo.ManagerShowInfo;
import com.kh.show.showInfo.model.vo.ManagerShowInfo2;
import com.kh.show.showInfo.model.vo.ManagerUpdateShow;
import com.kh.show.showInfo.model.vo.Show;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService service;
	
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
	        return "redirect:/managerLogin";
	    }
	}
	
	@RequestMapping("/managerPage/managerLogout")
	public String logoutManager(HttpSession session) {
		
		session.removeAttribute("loginManager");
		session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		
		return "redirect:/";	
	}
	
	@RequestMapping("/managerPage")
	public String managerInfo() {
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/noticeInsert")
	public String moveNoticeInsert() {
		return "manager/noticeInsert";
	}
	
	@GetMapping("/managerPage/showInsert")
	public String moveShowInsert() {
		return "manager/showInsert";
	}
	
	@PostMapping("/managerPage/showInsert")
	public String showInsert(
	    @ModelAttribute Show show,
	    @RequestParam("posterImage") MultipartFile posterFile,
	    @RequestParam("detailImage") MultipartFile detailFile,
	    HttpServletRequest request,
	    HttpSession session) {
	    
	    String genreNameArr[] = {"뮤지컬", "연극", "콘서트", "클래식", "전시"};
	    String regionNameArr[] = {"서울", "경기,인천", "충청,강원", "대구,경북", "부산,경남", "광주,전라", "제주"};
	    
	    String genreName = genreNameArr[show.getGenreNo()-1];
	    String regionName = regionNameArr[show.getRegionNo()-1];
	    
	    if (!posterFile.isEmpty()) {
	        
	        String posterOriginName = posterFile.getOriginalFilename();
	        String detailOriginName = detailFile.getOriginalFilename();
	        String startDate = show.getShowStart().replace("-", "");
	        String endDate = show.getShowEnd().replace("-", "");
	        String posterChangeName = genreName + "_" + regionName + "_메인_" + show.getShowName() + "_" + startDate + "_" + endDate + ".png";
	        String detailChangeName = genreName + "_" + regionName + "_상세_" + show.getShowName() + "_" + startDate + "_" + endDate + ".png";
	        

	        // 경로 지정
	        String posterSavePath = session.getServletContext().getRealPath("/resources/PosterUploadFiles/");
	        String detailSavePath = session.getServletContext().getRealPath("/resources/DetailUploadFiles/");
	        
	        // 폴더 생성 (이미 존재하지 않으면)
	        File posterDir = new File(posterSavePath);
	        if (!posterDir.exists()) {
	            posterDir.mkdirs();
	        }

	        // 상위 폴더를 만들고 하위 폴더도 생성
	        String posterSubDirPath = posterSavePath + "/" + genreName + "_" + regionName;
	        File posterSubDir = new File(posterSubDirPath);
	        if (!posterSubDir.exists()) {
	            posterSubDir.mkdirs();
	        }

	        File detailDir = new File(detailSavePath);
	        if (!detailDir.exists()) {
	            detailDir.mkdirs();
	        }

	        // 상위 폴더를 만들고 하위 폴더도 생성
	        String detailSubDirPath = detailSavePath + "/" + genreName + "_" + regionName;
	        File detailSubDir = new File(detailSubDirPath);
	        if (!detailSubDir.exists()) {
	            detailSubDir.mkdirs();
	        }

	        // 파일 저장
	        File savePosterFile = new File(posterSubDirPath + File.separator + posterChangeName); // 경로 + 파일명
	        try {
	            posterFile.transferTo(savePosterFile);
	        } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	        }
	        
	        if (!detailFile.isEmpty()) {
	            File saveDetailFile = new File(detailSubDirPath + File.separator + detailChangeName); // 경로 + 파일명
	            try {
	                detailFile.transferTo(saveDetailFile);
	            } catch (IllegalStateException | IOException e) {
	                e.printStackTrace();
	            }
	        }

	        // VO에 값 세팅
	        show.setGenreNo(show.getGenreNo());
	        show.setRegionNo(show.getRegionNo());
	        show.setHallNo(show.getHallNo());
	        show.setPosterOriginName(posterOriginName);
	        show.setPosterChangeName(posterChangeName);
	        show.setDetailOriginName(detailOriginName);
	        show.setDetailChangeName(detailChangeName);

	        // 서비스 호출
	        int result = service.showInsert(show);

	        if (result > 0) {
	            session.setAttribute("alertMsg", "공연 생성 완료");
	        } else {
	            session.setAttribute("alertMsg", "공연 생성 실패");
	        }
	    }
	    return "manager/managerPage";
	}
	
//	공지사항 등록하기
	@PostMapping("/managerPage/noticeInsert")
	public String noticeInsert(@ModelAttribute Notice n,
							   HttpSession session) {
		
		int noticeInsertResult = service.noticeInsert(n);
		
		if(noticeInsertResult>0) {
			session.setAttribute("alertMsg", "공지사항 등록이 완료되었습니다.");
			return "redirect:/managerPage";
		} else {
			session.setAttribute("alertMsg", "공지사항 등록에 실패하였습니다.");
			return "redirect:/managerPage";
		}
	}
	
//	공지 목록 불러오기
	@GetMapping("/managerPage/noticeList")
	@ResponseBody
	public List<Notice> selectAllNotice(){
		return service.selectAllNotice();
	}
	
//	공지 상세보기
	@GetMapping("/managerPage/notice")
	@ResponseBody
	public Notice noticeDetail(@RequestParam(value = "noticeNo") int noticeNo, Model model) {
	    Notice n = service.noticeDetail(noticeNo);  // service에서 해당 데이터를 가져옵니다.
	    model.addAttribute("notice", n);
	    return n;  // 반환된 데이터를 프론트엔드에 전송
	}
	
//	FAQ(자주 묻는 질문) 목록 불러오기
	@GetMapping("/managerPage/faqList")
	@ResponseBody
	public List<Faq> selectAllFaq(){
		return service.selectAllFaq();
	}
	
//	FAQ(자주 묻는 질문) 상세보기
	@GetMapping("/managerPage/faq")
	@ResponseBody
	public Faq faqDetail(@RequestParam(value = "faqNo") int faqNo, Model model) {
		Faq f = service.faqDetail(faqNo);
		model.addAttribute("faq", f);
		return f;
	}
	
//	meeting(소모임) 상세보기
	@GetMapping("/managerPage/meeting")
	@ResponseBody
	public ManagerMeeting meetingDetail(@RequestParam(value = "meetingNo") int meetNo, Model model) {
		ManagerMeeting m = service.meetingDetail(meetNo);
		model.addAttribute("meeting", m);
		return m;
	}
	
//	chat(채팅) 상세보기
	@GetMapping("/managerPage/chat")
	@ResponseBody
	public ManagerChat chatDetail(@RequestParam(value = "chatNo") int chatNo, Model model) {
		ManagerChat c = service.chatDetail(chatNo);
		model.addAttribute("chat", c);
		return c;
	}
	
//	FAQ(자주 묻는 질문) 생성
	@GetMapping("/managerPage/faqInsert")
	public String insertFaq() {
		return "manager/faqInsert";
	}
	
	@PostMapping("/managerPage/faqInsert")
	public String insertFaq(@ModelAttribute Faq f, HttpSession session) {
		
		int insertFaqResult = service.insertFaq(f);
		
		if(insertFaqResult>0) {
			session.setAttribute("alertMsg", "FAQ 등록이 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "FAQ 등록에 실패하였습니다.");
		}
		
		return "redirect:/managerPage";
	}
	
//	멤버 목록 불러오기
	@GetMapping("/managerPage/memberList")
	@ResponseBody
	public List<Member> selectAllMember(){
		return service.selectAllMember();
	}
	
//	예약 목록 불러오기
	@GetMapping("/managerPage/reservList")
	@ResponseBody
	public List<Reservation> selectAllReserv(){
		return service.selectAllReserv();
	}
	
//	공연 목록 불러오기
	@GetMapping("/managerPage/showList")
	@ResponseBody
	public List<ManagerShowInfo> selectAllShow(){
		
		return service.selectAllShow();
	}
	
//	예약 목록 불러오기
	@GetMapping("/managerPage/questionList")
	@ResponseBody
	public List<ManagerQuestion> selectAllQuestion(){
		return service.selectAllQuestion();
	}
	
//	소모임 목록 불러오기
	@GetMapping("/managerPage/meetingList")
	@ResponseBody
	public List<Meeting> selectAllMeeting(){
		return service.selectAllMeeting();
	}
	
//	채팅 목록 불러오기
	@GetMapping("/managerPage/chatList")
	@ResponseBody
	public List<Chat> selectAllChat(){
		return service.selectAllChating();
	}
	
	
	


	

	@GetMapping("/managerPage/show")
	@ResponseBody
	public ManagerShowInfo2 showDetail(@RequestParam(value = "showNo") int showNo, Model model, HttpSession session) {
	    ManagerShowInfo2 s = service.showDetail(showNo);
	    String contextPath = session.getServletContext().getContextPath();
	    String genreName = s.getGenreName();
	    String regionName = s.getRegionName();
	    String posterSavePath = contextPath + "/resources/PosterUploadFiles/" + genreName + "_" + regionName + "/" + s.getPosterChangeName();
	    String detailSavePath = contextPath + "/resources/DetailUploadFiles/" + genreName + "_" + regionName + "/" + s.getDetailChangeName();
	    s.setPosterPath(posterSavePath);
	    s.setDetailPath(detailSavePath);
	    model.addAttribute("show", s);
	    model.addAttribute("contextPath", contextPath);
	    return s;
	}
	
	@GetMapping("/managerPage/reserv")
	@ResponseBody
	public ManagerPageReservation2 reservDetail(@RequestParam(value = "reservId") int reservNo, Model model) {
		ManagerPageReservation2 r = service.reservDetail(reservNo);
		model.addAttribute("reserv", r);
		return r;
	}
	
	@GetMapping("/managerPage/question")
	@ResponseBody
	public ManagerQuestion2 questionDetail(@RequestParam(value = "questionNo") Integer qNo, Model model) {
	    ManagerQuestion2 q = service.questionDetail(qNo);
	    q.setChangeName("/resources/questionUpFile/" + q.getChangeName());
	    model.addAttribute("question", q);
	    return q;
	}
	
	@GetMapping("/managerPage/user")
	@ResponseBody
	public Member userDetail(@RequestParam(value = "userNo") Integer uNo, Model model) {
		Member m = service.userDetail(uNo);
		model.addAttribute("member", m);
		return m;
	}
		
	@GetMapping("/managerPage/noticeUpdate")
	public String beforeNoticeUpdate(@RequestParam(value="noticeNo") int noticeNo, Model model){
		Notice notice = service.beforeNoticeUpdate(noticeNo);
		model.addAttribute("notice", notice);
		
		return "manager/noticeUpdate";
	}
	
	@PostMapping("/managerPage/noticeUpdate")
	public String afterNoticeUpdate(HttpServletRequest request, HttpSession session) {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		Notice notice = new Notice();
		notice.setNoticeNo(noticeNo);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContent(noticeContent);
		int result = service.afterNoticeUpdate(notice);
		
		if(result>0) {
			session.setAttribute("alertMsg", "공지사항 수정이 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "공지사항 수정에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/faqUpdate")
	public String beforeFaqUpdate(@RequestParam(value="faqNo") int faqNo, Model model) {
		Faq faq = service.beforeFaqUpdate(faqNo);
		model.addAttribute(faq);
		
		return "manager/faqUpdate";
	}
	
	@PostMapping("/managerPage/faqUpdate")
	public String afterFaqUpdate(HttpServletRequest request, HttpSession session) {
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		String faqTitle = request.getParameter("faqTitle");
		String faqContent = request.getParameter("faqContent");
		Faq faq = new Faq();
		faq.setFaqNo(faqNo);
		faq.setFaqTitle(faqTitle);
		faq.setFaqContent(faqContent);
		int result = service.afterFaqUpdate(faq);
		if(result>0) {
			session.setAttribute("alertMsg", "FAQ 수정이 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "FAQ 수정에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/userUpdate")
	public String beforeUserUpdate(@RequestParam(value="userNo") Integer userNo, Model model) {
		Member m = service.beforeUserUpdate(userNo);
		model.addAttribute(m);
		
		return "manager/userUpdate";
	}
	
	@PostMapping("managerPage/userUpdate")
	public String afterUserUpdate(HttpServletRequest request, HttpSession session) {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userRrn = request.getParameter("userRrn");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String rank = request.getParameter("rank");
		String subscribe = request.getParameter("subscribe");
		Member m = new Member();
		m.setUserNo(userNo);
		m.setUserId(userId);
		m.setUserName(userName);
		m.setUserRrn(userRrn);
		m.setPhone(phone);
		m.setEmail(email);
		m.setAddress(address);
		m.setRank(rank);
		m.setSubscribe(subscribe);
		
		int result = service.afterUserUpdate(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원 정보 수정이 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "회원 정보 수정에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/showUpdate")
	public String beforeUpdateShow(@RequestParam(value="showNo") int showNo, Model model, HttpSession session, HttpServletRequest request) {
		ManagerUpdateShow show = service.beforeShowUpdate(showNo);
        String startDate = show.getShowStart().replace("-", "");
        String endDate = show.getShowEnd().replace("-", ""); 
        /*
        String posterSavePath = session.getServletContext().getRealPath("/resources/PosterUploadFiles/"+show.getGenreName()+"_"+show.getRegionName()+"/");
        String detailSavePath = session.getServletContext().getRealPath("/resources/DetailUploadFiles/"+show.getGenreName()+"_"+show.getRegionName()+"/");
        */
        String posterChangeName = show.getGenreName() + "_" + show.getRegionName() + "_메인_" + show.getShowName() + "_" + startDate + "_" + endDate + ".png";
        String detailChangeName = show.getGenreName() + "_" + show.getRegionName() + "_상세_" + show.getShowName() + "_" + startDate + "_" + endDate + ".png";
        String posterPath = "/resources/PosterUploadFiles/" + show.getGenreName() + "_" + show.getRegionName() + "/" + posterChangeName;
        String detailPath = "/resources/DetailUploadFiles/" + show.getGenreName() + "_" + show.getRegionName() + "/" + detailChangeName;
        session.setAttribute("posterPath", posterPath);
        session.setAttribute("detailPath", detailPath);
        show.setPosterChangeName(posterChangeName);
        show.setDetailChangeName(detailChangeName);
        show.setPosterPath(posterPath);
        show.setDetailPath(detailPath);
        
		model.addAttribute("show", show);
		
		return "manager/showUpdate";
	}
	
	@PostMapping("/managerPage/showUpdate")
	public String showUpdate(
	    @ModelAttribute Show show,
	    @RequestParam("posterImage") MultipartFile posterFile,
	    @RequestParam("detailImage") MultipartFile detailFile,
	    HttpServletRequest request,
	    HttpSession session) {
		
	    String genreNameArr[] = {"뮤지컬", "연극", "콘서트", "클래식", "전시"};
	    String regionNameArr[] = {"서울", "경기/인천", "충청/강원", "대구/경북", "부산/경남", "광주/전라", "제주"};
	    
	    String genreName = genreNameArr[show.getGenreNo()-1];
	    String regionName = regionNameArr[show.getRegionNo()-1];
	    
	    if (!posterFile.isEmpty()) {
	        
	        String posterOriginName = posterFile.getOriginalFilename();
	        String detailOriginName = detailFile.getOriginalFilename();
	        String startDate = show.getShowStart().replace("-", "");
	        String endDate = show.getShowEnd().replace("-", "");
	        String posterChangeName = genreName + "_" + regionName + "_메인_" + show.getShowName() + "_" + startDate + "_" + endDate + ".png";
	        String detailChangeName = genreName + "_" + regionName + "_상세_" + show.getShowName() + "_" + startDate + "_" + endDate + ".png";
	        

	        // 경로 지정
	        String posterSavePath = session.getServletContext().getRealPath("/resources/PosterUploadFiles/");
	        String detailSavePath = session.getServletContext().getRealPath("/resources/DetailUploadFiles/");
	        
	     // 폴더 생성 (이미 존재하지 않으면)
	        File posterDir = new File(posterSavePath);
	        if (!posterDir.exists()) {
	            posterDir.mkdirs();
	        }

	        // 상위 폴더를 만들고 하위 폴더도 생성
	        String posterSubDirPath = posterSavePath + File.separator + genreName + "_" + regionName;
	        File posterSubDir = new File(posterSubDirPath);
	        if (!posterSubDir.exists()) {
	            posterSubDir.mkdirs();
	        }

	        File detailDir = new File(detailSavePath);
	        if (!detailDir.exists()) {
	            detailDir.mkdirs();
	        }

	        // 상위 폴더를 만들고 하위 폴더도 생성
	        String detailSubDirPath = detailSavePath + File.separator + genreName + "_" + regionName;
	        File detailSubDir = new File(detailSubDirPath);
	        if (!detailSubDir.exists()) {
	            detailSubDir.mkdirs();
	        }

	        // 파일 저장
	        File savePosterFile = new File(posterSubDirPath + File.separator + posterChangeName); // 경로 + 파일명
	        try {
	            posterFile.transferTo(savePosterFile);
	        } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	        }
	        
	        if (!detailFile.isEmpty()) {
	            File saveDetailFile = new File(detailSubDirPath + File.separator + detailChangeName); // 경로 + 파일명
	            try {
	                detailFile.transferTo(saveDetailFile);
	            } catch (IllegalStateException | IOException e) {
	                e.printStackTrace();
	            }
	        }

	        // VO에 값 세팅
	        show.setGenreNo(show.getGenreNo());
	        show.setRegionNo(show.getRegionNo());
	        show.setHallNo(show.getHallNo());
	        show.setPosterOriginName(posterOriginName);
	        show.setPosterChangeName(posterChangeName);
	        show.setDetailOriginName(detailOriginName);
	        show.setDetailChangeName(detailChangeName);
	        // 서비스 호출
	        int result = service.afterShowUpdate(show);

	        if (result > 0) {
	            session.setAttribute("alertMsg", "공연 수정 완료");
	        } else {
	            session.setAttribute("alertMsg", "공연 수정 실패");
	        }
	    }
	    return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/questionAnswer")
	public String questionAnswer(@RequestParam(value="questionNo") int qNo, Model model){
		ManagerQuestion2 m = service.beforeQuestionAnswer(qNo);
		model.addAttribute("answer", m);
		
		return "manager/questionAnswer";
	}
	
	@PostMapping("/managerPage/questionAnswer")
	public String questionAnswer(HttpServletRequest request, HttpSession session) {
		int qNo = Integer.parseInt(request.getParameter("questionNo"));
		String answerContent = request.getParameter("answerContent");
		
		ManagerQuestion2 m = new ManagerQuestion2();
		
		m.setQuestionNo(qNo);
		m.setAnswerContent(answerContent);
		
		int result = service.afterQuestionAnswer(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "답변이 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "답변에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/meetingUpdate")
	public String beforeMeetingUpdate(@RequestParam(value="meetingNo") int mNo, Model model) {
		ManagerMeeting m = service.beforeMeetingUpdate(mNo);
		model.addAttribute("meeting", m);
		return "manager/meetingUpdate";
	}
	
	@PostMapping("/managerPage/meetingUpdate")
	public String afterMeetingUpdate(HttpServletRequest request, HttpSession session) {
		int mNo = Integer.parseInt(request.getParameter("meetingNo"));
		String mTitle = request.getParameter("meetingTitle");
		String info = request.getParameter("infomation");
		
		ManagerMeeting m = new ManagerMeeting();
		
		m.setMeetingNo(mNo);
		m.setMeetingTitle(mTitle);
		m.setInformation(info);
		
		int result = service.afterMeetingUpdate(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "소모임 수정이 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "소모임 수정에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/noticeDelete")
	public String noticeDelete(@RequestParam(value="noticeNo") int noticeNo, HttpServletRequest request, HttpSession session) {
		
		int result = service.noticeDelete(noticeNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "공지사항 삭제가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "공지사항 삭제에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/faqDelete")
	public String faqDelete(@RequestParam(value="faqNo") int faqNo, HttpServletRequest request, HttpSession session) {
		
		int result = service.faqDelete(faqNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "FAQ 삭제가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "FAQ 삭제에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/meetingDelete")
	public String meetingDelete(@RequestParam(value="meetingNo") int meetingNo, HttpServletRequest request, HttpSession session) {
		
		int result = service.meetingDelete(meetingNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "소모임 삭제가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "소모임 삭제에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/showDelete")
	public String showDelete(@RequestParam(value="showNo") int showNo, HttpServletRequest request, HttpSession session) {
		
		int result = service.showDelete(showNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "공연 삭제가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "공연 삭제에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/questionDelete")
	public String questionDelete(@RequestParam(value="questionNo") int questionNo, HttpServletRequest request, HttpSession session) {
		
		int result = service.questionDelete(questionNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "1:1문의 삭제가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "1:1문의 삭제에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/userDelete")
	public String userDelete(@RequestParam(value="userNo") int userNo, HttpServletRequest request, HttpSession session) {
		
		int result = service.userDelete(userNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원 탈퇴가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "회원 탈퇴에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/chatDelete")
	public String chatDelete(@RequestParam(value="chatNo") int chatNo, HttpServletRequest request, HttpSession session) {
		
		int result = service.chatDelete(chatNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "채팅방 삭제가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "채팅방 삭제에 실패하였습니다.");
		}
		
		return "manager/managerPage";
	}
	
	@GetMapping("/managerPage/reservationDelete")
	public String reservDelete(@RequestParam(value="reservationId") int reservId, HttpServletRequest reqeust, HttpSession session) {
		
		int result = service.reservDelete(reservId);
		
		if(result>0) {
			session.setAttribute("alertMsg", "예약 취소가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "예약 취소에 실패하였습니다.");
		}
		
		return "manager/managerPage";
		
	}
}
