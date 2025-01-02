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
	    String regionNameArr[] = {"서울", "경기/인천", "충청/강원", "대구/경북", "부산/경남", "광주/전라", "제주"};
	    
	    String genreName = genreNameArr[show.getGenreNo()-1];
	    String regionName = regionNameArr[show.getRegionNo()-1];
	    
	    if (!posterFile.isEmpty()) {
	        
	        String posterOriginName = posterFile.getOriginalFilename();
	        String detailOriginName = detailFile.getOriginalFilename();
	        String extension = posterOriginName.substring(posterOriginName.lastIndexOf("."));
	        String startDate = show.getShowStart().replace("-", "");
	        String endDate = show.getShowEnd().replace("-", "");
	        String posterChangeName = genreName + "_" + regionName + "_메인_" + show.getShowName() + "_" + startDate + "_" + endDate + extension;
	        String detailChangeName = genreName + "_" + regionName + "_상세_" + show.getShowName() + "_" + startDate + "_" + endDate + extension;
	        

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
	        int result = service.showInsert(show);

	        if (result > 0) {
	            session.setAttribute("alertMsg", "공연 생성 완료");
	        } else {
	            session.setAttribute("alertMsg", "공연 생성 실패");
	        }
	    }
	    return "redirect:/managerPage";
	}
	
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
	
	@GetMapping("/managerPage/noticeList")
	@ResponseBody
	public List<Notice> selectAllNotice(){
		return service.selectAllNotice();
	}
	
	@GetMapping("/managerPage/faqList")
	@ResponseBody
	public List<Faq> selectAllFaq(){
		return service.selectAllFaq();
	}
	
	@GetMapping("/managerPage/memberList")
	@ResponseBody
	public List<Member> selectAllMember(){
		return service.selectAllMember();
	}
	
	@GetMapping("/managerPage/reservList")
	@ResponseBody
	public List<Reservation> selectAllReserv(){
		return service.selectAllReserv();
	}
	
	@GetMapping("/managerPage/showList")
	@ResponseBody
	public List<Show> selectAllShow(){
		return service.selectAllShow();
	}
	
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
	
	@GetMapping("/managerPage/notice")
	@ResponseBody
	public void noticeDetail(@RequestParam(value="noticeNo", required=true) String noticeNo) {
	    System.out.println("NoticeNo: " + noticeNo);  // Integer로 받기
	}
	
}
