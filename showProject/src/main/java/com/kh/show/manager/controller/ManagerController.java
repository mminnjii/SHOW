package com.kh.show.manager.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.show.customer.model.vo.Faq;
import com.kh.show.manager.model.service.ManagerService;
import com.kh.show.manager.model.vo.Manager;
import com.kh.show.member.model.vo.Member;
import com.kh.show.notice.model.vo.Notice;
import com.kh.show.reservation.model.vo.Reservation;
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
	
	@GetMapping("/showInsert")
	public String moveShowInsert() {
		return "manager/showInsert";
	}
	
	@PostMapping("/showInsert")
	public String showInsert(
	    @ModelAttribute Show show,
	    @RequestParam("posterImage") MultipartFile posterFile,
	    @RequestParam("detailImage") MultipartFile detailFile,
	    HttpServletRequest request,
	    HttpSession session) {
		
		String genreName = "";
		switch (show.getGenreNo()) {
		    case 1: genreName = "뮤지컬"; break;
		    case 2: genreName = "연극"; break;
		    case 3: genreName = "콘서트"; break;
		    case 4: genreName = "클래식"; break;
		    case 5: genreName = "전시"; break;
		    default: genreName = "기타"; break;
		}

		String regionName = "";
		switch (show.getRegionNo()) {
		    case 1: regionName = "서울"; break;
		    case 2: regionName = "경기/인천"; break;
		    case 3: regionName = "충청/강원"; break;
		    case 4: regionName = "대구/경북"; break;
		    case 5: regionName = "부산/경남"; break;
		    case 6: regionName = "광주/전라"; break;
		    case 7: regionName = "제주"; break;
		    default: regionName = "기타"; break;
		}

	    // 1. 파일 처리
	    if (!posterFile.isEmpty()) {
	        String posterOriginName = posterFile.getOriginalFilename();
	        String detailOriginName = detailFile.getOriginalFilename();
	        String extension = posterOriginName.substring(posterOriginName.lastIndexOf("."));

	        // 2. 파일명 처리
	        String changeName = genreName + "_" + regionName + "_메인_" + show.getShowName() + extension;
	        String posterSavePath = session.getServletContext().getRealPath("/resources/PosterUploadFiles/")+changeName;
	        String detailSavePath = session.getServletContext().getRealPath("/resources/DetailUploadFiles/")+changeName;

	        File poster = new File(posterSavePath);
	        if (!poster.exists()) {
	            poster.mkdirs();
	        }
	        
	        File detail = new File(detailSavePath);
	        if (!detail.exists()) {
	        	detail.mkdirs();
	        }

	        try {
	            posterFile.transferTo(poster);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        
	        try {
	        	detailFile.transferTo(detail);
	        } catch (IOException e) {
	        	e.printStackTrace();
	        }

	        // 3. VO에 값 세팅
	        show.setGenreNo(show.getGenreNo());
	        show.setRegionNo(show.getRegionNo());
	        show.setHallNo(show.getHallNo());
	        show.setPosterOriginName(posterOriginName);
	        show.setPosterChangeName(changeName);
	        show.setDetailOriginName(detailOriginName);
	        show.setDetailChangeName(changeName);

	        // 4. 서비스 호출
	        int result = service.showInsert(show);

	        if (result > 0) {
	        	session.setAttribute("alertMsg", "공연 생성 완료");
	            return "redirect:/";
	        } else {
	        	session.setAttribute("alertMsg", "공연 생성 실패");
	            return "redirect:/";
	        }
	    }

	    return "redirect:/showList";
	}
	
	
	@PostMapping("/noticeInsert")
	public String noticeInsert(@ModelAttribute Notice n,
							   HttpSession session) {
		
		int noticeInsert = service.noticeInsert(n);
		
		if(noticeInsert>0) {
			session.setAttribute("alertMsg", "공지사항 등록이 완료되었습니다.");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "공지사항 등록에 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	@GetMapping("/noticeList")
	@ResponseBody
	public List<Notice> selectAllNotice(){
		return service.selectAllNotice();
	}
	
	@GetMapping("/faqList")
	@ResponseBody
	public List<Faq> selectAllFaq(){
		return service.selectAllFaq();
	}
	
	@GetMapping("/memberList")
	@ResponseBody
	public List<Member> selectAllMember(){
		return service.selectAllMember();
	}
	
	@GetMapping("/reservList")
	@ResponseBody
	public List<Reservation> selectAllReserv(){
		return service.selectAllReserv();
	}
	
	@GetMapping("/showList")
	@ResponseBody
	public List<Show> selectAllShow(){
		return service.selectAllShow();
	}
	
	/*
	@RequestMapping("/noticeUpdate")
	public String noticeList(@ModelAttribute Notice n)
		notice n = service.updateNotice(n);
		
		return n;
	*/
	
	/*
	@RequestMapping("/noticeDelete")
	public String noticeDelete(@ModelAttribute Notice n)
		notice n = service.deleteNotice(n);
		
		return n;
	 */
}
