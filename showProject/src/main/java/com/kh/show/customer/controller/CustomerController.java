package com.kh.show.customer.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.show.customer.model.service.CustomerService;
import com.kh.show.customer.model.vo.Faq;
import com.kh.show.customer.model.vo.Question;
import com.kh.show.member.model.vo.Member;
import com.kh.show.reservation.model.vo.Reservation;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	
	
	@GetMapping("/cmain")
	public ModelAndView cmain(ModelAndView mv) {
		
		log.info("고객센터 페이지");
		
		// faq TOP 5 LIST
		ArrayList<Faq> faqList = customerService.selectFaqList();
		
		for(Faq f:faqList) {
			String faqContent = f.getFaqContent();
			// content 값을 가져와 \n 줄바꿈을 html에서 처리 가능하도록 <br> 태그로 바꾸어 처리해준다.
			faqContent = faqContent.replace("\n", "<br>");
			
			f.setFaqContent(faqContent);
		}

		// 전달할 값 			/	값을 보낼 view 
		mv.addObject("faqList", faqList).setViewName("customerService/customerService");
		
		return mv;
	}
	
	// faq 리스트
	@GetMapping("/faq")
	public String faqList(Model m){

		ArrayList<Faq> faqList = customerService.selectFaqList();

		for(Faq f:faqList) {
			String faqContent = f.getFaqContent();
			// null 값인 경우에는 빈 값에 접근이 불가능하므로 조건처리 해주어야 한다. 
			if(faqContent != null) {
				faqContent = faqContent.replace("\n", "<br>");
			}
			f.setFaqContent(faqContent);
		}

		m.addAttribute("faqList", faqList);
		
		return "customerService/faq";
	}
	
	// faq 카테고리별 리스트 
	@ResponseBody
	@GetMapping(value={"/faqFilter"}, produces = "application/json; charset=UTF-8")
	public ArrayList<Faq> faqFilterList(String qcategoryNo, Model m) {
		
		System.out.println(qcategoryNo);
		ArrayList<Faq> faqList = null;
		
		// qcategoryNo의 값이 all 이면 전체 출력. 아니면 카테고리별로 출력.
		if(qcategoryNo.equals("all")) {
			faqList = customerService.selectFaqList();
		}else {			
			faqList = customerService.faqFilterList(qcategoryNo);
		}
		
		for(Faq f:faqList) {
			String faqContent = f.getFaqContent();
			if(faqContent != null) {
				faqContent = faqContent.replace("\n", "<br>");
			}
			f.setFaqContent(faqContent);
		}
	
		return faqList;
	}
	
	
	// faq 검색 리스트
	@ResponseBody
	@GetMapping(value="/search", produces = "application/json; charset=UTF-8") 
	public ArrayList<Faq> faqSearchList(String keyword){
		
		ArrayList<Faq> searchList = customerService.faqSearchList(keyword);
		
		for(Faq s: searchList) {
			String faqContent = s.getFaqContent();
			if(faqContent != null) {
				faqContent = faqContent.replace("\n", "<br>");
			}
			s.setFaqContent(faqContent);
		}
		
		return searchList;
	}
	
	// 1:1 문의 페이지로 이동 
	@GetMapping("/question")
	public String question() {
		
		return "customerService/question";
	}
	
	
	// 1:1 문의 등록 
	// 회원이 아닌 경우와 회원인 경우 나누는 조건 처리 필요 
	@PostMapping("/queInsert")
	public String questionInsert(Question q, MultipartFile upfile, HttpSession session, Member m) {
		
		System.out.println(q);
		System.out.println("문의 회원 : " + m);
		
		// 파일이 있는 경우 
		if(!upfile.getOriginalFilename().equals("")) {
			// 파일명 수정 작업 
			String changeName = saveFile(upfile, session);
			
			q.setOriginName(upfile.getOriginalFilename());
			q.setChangeName("/resources/questionUpFile/" + changeName);
		}
		
		int result = customerService.questionInsert(q);
		
		String alertMsg = "";
		
		if(result>0) {
			alertMsg = "1:1 문의가 등록되었습니다. 마이페이지에서 내역을 확인하실 수 있습니다.";
		}else {
			alertMsg = "1:1 문의등록이 실패되었습니다." ;
		}

		session.setAttribute("alertMsg", alertMsg);

		return "redirect:/cmain";
	}
	
	
	
	// 파일 업로드 처리 메소드 
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 1. 파일명 추출
		String originName = upfile.getOriginalFilename();
		
		// 2. 시간 형식 문자열로 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 확장자 추출 
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 4. 랜텀 값 추출 
		int ranNum = (int) ((Math.random()*90000)+1);
		
		// 5. 합치기 
		String changeName = currentTime + ranNum + ext ;
		
		// 6. 업로드 서버의 경로 
		String savePath = session.getServletContext().getRealPath("/resources/questionUpFile/");
		
		// 7. transferTo : 업로드 메소드 사용하여 파일 업로드 처리 
		try {
			upfile.transferTo(new File(savePath+changeName));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 회원 예약번호 조회 
				// Reservation VO 파일 reservation 폴더에 있는 걸로 다시 import 해야 한다. 
	@ResponseBody
	@PostMapping(value="/reSearch", produces = "application/json; charset=UTF-8")
	public ArrayList<Reservation> reSearch(int userNo){
		
		ArrayList<Reservation> reList = customerService.reSearch(userNo);
		
		return reList;
	}

	
	// faq 클릭시 count
	@PostMapping("/faqCount")
	public void faqCount(String faqNo) {
		
		int result = customerService.faqCount(faqNo);

	}
	

	//qna 상세 페이지
	@GetMapping("qDetail")
	public ModelAndView selectQna(Question q,
								  int qno,
								  ModelAndView mv) {
		q = customerService.selectQna(qno);
		mv.addObject("q",q).setViewName("member/myQnaDetail");
		
		return mv;
	}
	
	//qna 수정
	@GetMapping("qUpdate")
	public String quPage(int qno,
						  Model model) {
		Question q = customerService.selectQna(qno);
		
		model.addAttribute("q", q);
		
		return "customerService/questionUpdate";
	}
	
	//qna 수정 처리
	@PostMapping("qUpdate")
	public String updateQna(Question q,
							MultipartFile reUpfile,
							HttpSession session) {
		String deleteFile = null;
		
		if(!reUpfile.getOriginalFilename().equals("")) {
			if(q.getOriginName()!=null) {
				deleteFile = q.getChangeName();
			}
			
			String changeName = saveFile(reUpfile,session);
			
			q.setOriginName(reUpfile.getOriginalFilename());
			q.setChangeName(changeName);
		}
		System.out.println(q);
		int result = customerService.updateQna(q);
		
		if(result>0) {
			if(deleteFile != null) {
				new File(session.getServletContext().getRealPath(deleteFile)).delete();
			}
			session.setAttribute("alertMsg", "문의 내역 수정 성공!");
		}else{
			session.setAttribute("alertMsg", "문의 내역 수정 실패!");
		}
		
		return "redirect:/member/qna?userNo="+q.getUserNo();
	}
	
	//qna 삭제
	@PostMapping("qnaDelete")
	public String qnaDelete(int questionNo,
							String userNo,
							String filePath,
							HttpSession session) {
		int result = customerService.qnaDelete(questionNo);
		
		if(result>0) {
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "문의 내용 삭제 성공!");
			return "redirect:/member/qna?userNo="+userNo;
		}else {
			session.setAttribute("alertMsg", "문의 내용 삭제 실패!");
			return "redirect:/member/qna?userNo="+userNo;
		}
	}

	
}
