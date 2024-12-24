package com.kh.show.showInfo.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.show.showInfo.model.service.ShowInfoService;
import com.kh.show.showInfo.model.vo.Review;
import com.kh.show.showInfo.model.vo.Show;
import com.kh.show.showInfo.model.vo.ShowRound;

@Controller
@RequestMapping("/showInfo") 
public class ShowInfoController {
	
	
	@Autowired
	private ShowInfoService showInfoService;
	
	
	//공연상세이동
	@GetMapping("/detail")
	public String detail(HttpSession session) {
		
		// 공연정보조회
		Show s = showInfoService.selectShow();
		session.setAttribute("s", s);
		
		// 날짜조회
		ArrayList<ShowRound> date  = showInfoService.selectRound();  
		session.setAttribute("date", date);
		
		return "show/showInfo/detailInfo";
	}
	
	
	@GetMapping("/selectDate")
	public String selectDate() {
		
		
		return "show/showInfo/detailInfo";
	}
	
	
	// 리뷰이동
	@GetMapping("/review")
	public String review(HttpSession session, Model model) {
		
			Show s = (Show)session.getAttribute("s");

		    // 세션에 데이터가 없으면 DB에서 다시 조회
		    if (s == null) {
		        s = showInfoService.selectShow();
		        session.setAttribute("s", s); // 다시 세션에 저장
		    }
		    model.addAttribute("s", s);
		
		
		// 리뷰 갯수 세어오기
		int count =  showInfoService.selectRcount(); 
		model.addAttribute("count",count);
		
		// 리뷰 조회
	    ArrayList<Review> list  = showInfoService.selectReview();  
	    model.addAttribute("r", list);
	    	    
	    
	    double reviewAvg  = 0;
	    
		for(Review r : list ) { 
			reviewAvg += r.getReviewScore();
			
			String id = r.getUserId();
			String maskedBid = id.substring(0, id.length() - 3).replaceAll(".", "*") + id.substring(id.length() - 3);
			r.setUserId(maskedBid);
		}
		
		reviewAvg = Math.round((reviewAvg/count) * 10) / 10.0;
		double avgFloor = Math.floor(reviewAvg);
		
		session.setAttribute("reviewAvg", reviewAvg);
		session.setAttribute("avgFloor", avgFloor);
		
		return "show/showInfo/review";
	}
	
	//  리뷰 검색
	@GetMapping("/reviewSearch")
	public String reviewSearch(Model model, String keyword) {
		 
		ArrayList<Review> list  = showInfoService.reviewSearch(keyword); 
		model.addAttribute("r", list);
		
		// 검색된 리뷰 갯수 세어오기
		int count =  showInfoService.searchRcount(keyword); 
		model.addAttribute("count",count);
		
		
		return "show/showInfo/review";
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
	

	

	// 상세정보 이동
	@GetMapping("/info")
	public String info() {
	
		return "info";
	}
	
	
}
