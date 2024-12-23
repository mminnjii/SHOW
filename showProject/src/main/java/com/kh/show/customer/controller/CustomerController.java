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
		
					// 전달할 값 			/	값을 보낼 view 
		mv.addObject("faqList", faqList).setViewName("customerService/customerService");
		
		return mv;
	}
	
	// faq 리스트
	@GetMapping("/faq")
	public String faqList(Model m){

		ArrayList<Faq> faqList = customerService.selectFaqList();

		m.addAttribute("faqList", faqList);
		
		return "customerService/faq";
	}
	
	// faq 카테고리별 리스트 
	@ResponseBody
	@GetMapping(value={"/faqFilter", "/cmain"}, produces = "application/json; charset=UTF-8")
	public ArrayList<Faq> faqFilterList(String qcategoryNo, Model m) {
		
		System.out.println(qcategoryNo);
		ArrayList<Faq> faqList = null;
		
		// qcategoryNo의 값이 all 이면 전체 출력. 아니면 카테고리별로 출력.
		if(qcategoryNo.equals("all")) {
			faqList = customerService.selectFaqList();
		}else {			
			faqList = customerService.faqFilterList(qcategoryNo);
		}
		
//		for(Faq f : faqList) {
//			System.out.println(faqList);
//		}
		
		return faqList;
	}
	
	
	// faq 검색 리스트
	@ResponseBody
	@GetMapping(value="/search", produces = "application/json; charset=UTF-8") 
	public ArrayList<Faq> faqSearchList(String keyword){
		
		ArrayList<Faq> searchList = customerService.faqSearchList(keyword);
		
		return searchList;
	}
	
	// 1:1 문의 페이지로 이동 
	@GetMapping("/question")
	public String question() {
		
		return "customerService/question";
	}
	
	
	// 1:1 문의 내역 등록 
	// 회원이 아닌 경우와 회원인 경우 나누는 조건 처리 필요
	@PostMapping("/queInsert")
	public String questionInsert(Question q, MultipartFile upfile, HttpSession session, Member m) {
		
		System.out.println(upfile);
		System.out.println(m);
		
		// 파일이 있는 경우 
		if(!upfile.getOriginalFilename().equals("")) {
			// 파일명 수정 작업 
			String changeName = saveFile(upfile, session);
			
			q.setOriginName(upfile.getOriginalFilename());
			q.setChangeName("/resources/questionUpFile/" + changeName);
		}
		
		System.out.println("Question (파일명 변경포함): "+q);
		
		int result = 0;
		
		// 회원 비회원에 따라 저장되는 DB가 다르다. 
		if(m.getUserNo() != 0) {  // 회원인 경우
			result = customerService.questionInsert(q);
		}else {  // 회원이 아닌 경우 
			result = customerService.questionNonInsert(q);			
		}
		
		String alertMsg = "";
		
		if(result>0) {
			alertMsg = (m.getUserNo() != 0) 
									? "1:1 문의가 등록되었습니다. 마이페이지에서 내역을 확인하실 수 있습니다." 
									: "1:1 문의가 등록되었습니다.";
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
		
		System.out.println(savePath);

		// 7. transferTo : 업로드 메소드 사용하여 파일 업로드 처리 
		try {
			System.out.println("저장경로+변경된파일명 : " + savePath+changeName);
			upfile.transferTo(new File(savePath+changeName));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("originName : "+originName);
		System.out.println("changeName : "+changeName);
		
		return changeName;
	}
	
	// 회원 예약번호 조회 
				// Reservation VO 파일 reservation 폴더에 있는 걸로 다시 import 해야 한다. 

	@ResponseBody
	@PostMapping(value="/reSearch", produces = "application/json; charset=UTF-8")
	public ArrayList<Reservation> reSearch(int userNo){
		
		// 진짜 회원번호를 넘겨받도록 기능 구현해야 한다.
//		System.out.println(userNo);
		
		ArrayList<Reservation> reList = customerService.reSearch(userNo);
		
		return reList;
	}

	
	// faq 클릭시 count
	@PostMapping("/faqCount")
	public void faqCount(String faqNo) {
		
		System.out.println(faqNo);
		
		int result = customerService.faqCount(faqNo);
					
		System.out.println(result);
	}
	

	
}
