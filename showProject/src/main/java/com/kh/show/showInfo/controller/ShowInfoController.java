package com.kh.show.showInfo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/showInfo") 
public class ShowInfoController {
	
	
	//공연상세이동
	@GetMapping("/detail")
	public String detail() {
	
		return "show/showInfo/detailInfo";
	}
	
	
	// 좌석이동
	@GetMapping("/seats")
	public String seats() {
		
		return "reservation/seats";
	}
	
	@ResponseBody
	@PostMapping("/selectedSeats")
	public int selectedSeats(HttpSession session, int num, String selectedName) {
		// System.out.println(num);
		// System.out.println(selectedName);
		// session.setAttribute("num", num);
		// session.setAttribute("selectedName", selectedName);
		
		return num;
	}
	
	// 리뷰이동
	@GetMapping("/review")
	public String review(HttpSession session) {
		
		double reviewRank  = 4.5;
		session.setAttribute("reviewRank", reviewRank);
		
		return "show/showInfo/review";
	}
	

	// 상세정보 이동
	@GetMapping("/info")
	public String info() {
	
		return "info";
	}
	
	// 캘린더 이동
	@GetMapping("/calendar")
	public String calendar() {
	
		return "calendar";
	}
	
	
}
