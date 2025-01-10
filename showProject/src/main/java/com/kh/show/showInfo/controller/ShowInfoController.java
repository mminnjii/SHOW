package com.kh.show.showInfo.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.show.member.model.service.MemberService;
import com.kh.show.member.model.vo.Member;
import com.kh.show.showInfo.model.service.ShowInfoService;
import com.kh.show.showInfo.model.vo.Review;
import com.kh.show.showInfo.model.vo.Show;
import com.kh.show.showInfo.model.vo.ShowRound;

@Controller
@RequestMapping("/showInfo") 
public class ShowInfoController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ShowInfoService showInfoService;
	
	//공연상세이동
	@GetMapping("/detail")
	public String detail(HttpSession session,String showName) {
		int result = showInfoService.increaseCount(showName);
		if(result>0) {
		
		// 공연정보조회
		Show s = showInfoService.selectShow(showName);
		session.setAttribute("s", s);
		
		String posterName= s.getPosterChangeName();
		posterName = posterName.substring(0, posterName.length() - 1) + "D";
		posterName = posterName.replace("/", "");
		s.setDetailChangeName(posterName);
		
		double sPrice = Integer.parseInt(s.getPrice().replace(",", ""));
		double vipPrice = sPrice*1.4;
		double rPrice = sPrice*1.2; 
		
		NumberFormat formatter = NumberFormat.getNumberInstance(Locale.US);
		session.setAttribute("vipPrice", formatter.format(vipPrice));
		session.setAttribute("rPrice", formatter.format(rPrice));
		session.setAttribute("sPrice", s.getPrice());
		session.setAttribute("Price", sPrice);

		
		// 회차정보 상태값 업데이트 (현재날짜 기준 / 공연장 좌석수 기준) disabled(status N) 설정하기
		int result1 = showInfoService.updateSysdate();  

		// 회차조회
		ArrayList<ShowRound> date  = showInfoService.selectRound();  
		session.setAttribute("date", date);
		
		// 회원 번호 담기
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser!=null) {
			session.setAttribute("userNo", loginUser.getUserNo());
			session.setAttribute("rank", loginUser.getRank());
			int cno = memberService.couponCount(loginUser.getUserNo());
			session.setAttribute("cno", cno);
		}

	}
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
	public String review(String showName,HttpSession session, Model model) {
		
			Show s = (Show)session.getAttribute("s");

		    // 세션에 데이터가 없으면 DB에서 다시 조회
		    if (s == null) {
		        s = showInfoService.selectShow(showName);
		        session.setAttribute("s", s); // 다시 세션에 저장
		    }
		    model.addAttribute("s", s);
		   int showNo =  s.getShowNo();
		   
		// 리뷰 갯수 세어오기
		int count =  showInfoService.selectRcount(showNo); 
		model.addAttribute("count",count);
		
		// 리뷰 조회
	    ArrayList<Review> list  = showInfoService.selectReview(showNo);  
	    model.addAttribute("r", list);
	    
	    double reviewAvg  = 0;
	    
		for(Review r : list ) { 
			
			reviewAvg += r.getReviewScore();
			// 사용자 아이디 마스킹 처리하기
			String id = r.getUserId();
			String maskedBid = id.substring(0, id.length() - 3).replaceAll(".", "*") + id.substring(id.length() - 3);
			r.setUserId(maskedBid);
		}
		
		// 리뷰평균값 매기기
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
		    
		    model.addAttribute("hashMap",hashMap);
			model.addAttribute("list",searchBox);
			return "common/searchPage";
					
		}else {
			
			model.addAttribute("hashMap",hashMap);
			return "common/searchError";
			
		}

		
		
		
		

	}
	
	
	
	
	
	// 리뷰 등록하기 이동
	@GetMapping("/enroll")
	public String enroll(Model model, int showNo) {
		model.addAttribute("showNo",showNo);
		return "show/showInfo/reviewEnroll";
	}
	
	
	// 리뷰 등록하기
	@ResponseBody
	@PostMapping(value = "/enrollReview",produces = "text/html; charset=UTF-8")
	public String enrollReview(Review r) {
		int enrollReview = showInfoService.enrollReview(r);
		
		if(enrollReview>0) {
			return "NNNNY";
		}else {
			return "NNNNN";
		}
	}
	
	
	// 리뷰 수정하기 이동
	@GetMapping("/update")
	public String updateSearch (Model model, int replyNo) {
		
		 Review r = showInfoService.searchReview(replyNo);
		 model.addAttribute("r",r);
		 
		 int rank = (int)r.getReviewScore()*20;
		 model.addAttribute("rank",rank);

		 return "show/showInfo/reviewUpdate";
	}
	
	
	// 리뷰 수정하기
	@ResponseBody
	@PostMapping(value = "/updateReview",produces = "text/html; charset=UTF-8")
	public String updateReview(Review r) {
		
		int enrollReview = showInfoService.updateReview(r);

		if(enrollReview>0) {
			return "NNNNY";
		}else {
			return "NNNNN";
		}
	}
	
	
	// 리뷰 삭제하기
	@ResponseBody
	@PostMapping(value = "/deleteReview",produces = "text/html; charset=UTF-8")
	public String deleteReview(int replyNo) {
		
		int deleteReview = showInfoService.deleteReview(replyNo);

		if(deleteReview>0) {
			return "NNNNY";
		}else {
			return "NNNNN";
		}
		
	}
	
	
	
	
}
