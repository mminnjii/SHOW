package com.kh.show.showInfo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		// 회차정보 상태값 업데이트 (현재날짜 기준 / 공연장 좌석수 기준) disabled(status N) 설정하기
		int result1 = showInfoService.updateSysdate();  
		int result2 = showInfoService.updateShowRound();
		
		// 회차조회
		ArrayList<ShowRound> date  = showInfoService.selectRound();  
		session.setAttribute("date", date);
		
		return "show/showInfo/detailInfo";
	}
	
	@ResponseBody
	@GetMapping(value = "selectDate")
	public ArrayList<ShowRound> selectTime(@RequestParam("date") String date) {

        ArrayList<ShowRound> tAndr  = showInfoService.selectTime(date); 
        
		return tAndr;
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
	


	// 상세정보 이동
	@GetMapping("/info")
	public String info() {
	
		return "info";
	}
	



	
	
	//검색기능
	@GetMapping("/search")
	public String searchBox(@RequestParam String keyword
							,Model model) {
		
		
		
		//전달받은 검색 조건 맵에 담기
		HashMap<String,String> hashMap = new HashMap<>();
		hashMap.put("keyword", keyword);
		
		
		int searchListCount = showInfoService.searchListCount(hashMap);
		
		// searchListCount 값을 hashMap에 추가
	    hashMap.put("count", String.valueOf(searchListCount));
		//HashMap은 기본적으로 문자열을 키로 사용한다.
	    //searchListCount는 int타입이기에 문자열로 변환해야 해서
	    //String.valueOf를 사용해준다.
	    
		if(searchListCount>0) {
			
					
		    ArrayList<Show> searchBox = showInfoService.searchBox(hashMap);
		    
		    System.out.println(searchBox);
		    
		    model.addAttribute("hashMap",hashMap);
			model.addAttribute("list",searchBox);
			
			return "common/searchPage";
					
		}else {
			
			model.addAttribute("hashMap",hashMap);
			
			
			return "common/searchError";
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
}
