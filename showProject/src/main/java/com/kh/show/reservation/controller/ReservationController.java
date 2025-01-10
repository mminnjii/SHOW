package com.kh.show.reservation.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.show.reservation.model.service.ReservationService;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.reservation.model.vo.SeatsOfRow;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	// 좌석이동
	@GetMapping("/seats")
	public String seats(HttpSession session, Model model, Reservation r) {
		
		// 회원번호 추출
		Integer userNo = (Integer) session.getAttribute("userNo");

		if (userNo != null) {
			
		    // Integer 값으로 타입 변환이 정상적으로 이루어졌을 때 처리
			session.setAttribute("userNo", userNo);
			
			// reservation 생성
	        r.setUserNo(userNo);
			
			int result = reservationService.createReservation(r);  
			
			if(result>0) {
				Reservation rInfo = reservationService.selectReservation();
				model.addAttribute("rInfo",rInfo);
				
			}else {
				model.addAttribute("errorMsg","예약이 생성되지 못했습니다. 다시 선택해주세요");
				return "common/errorPage";
			}
			
		} else {
		    // userNo가 null인 경우 처리
			model.addAttribute("errorMsg","로그인정보를 가져오지 못했습니다.");
			return "common/errorPage";
			
		}
		
		int roundId = r.getRoundId();
		
		// status "N"인 좌석 조회
		ArrayList<String> taken= reservationService.selectTakenSeats(roundId);  
		if(taken != null) {
			Gson gson = new Gson(); 
			model.addAttribute("taken",gson.toJson(taken));
		}else {
			model.addAttribute("errorMsg","status N인 좌석 조회에 실패했습니다.");
			return "common/errorPage";
		}
		
		// 등급별 좌석 수 조회
		ArrayList<SeatsOfRow> num  = reservationService.selectSeatsNum(roundId);  
		if(num != null) {
			model.addAttribute("num", num);
		}else {
			model.addAttribute("errorMsg","좌석수 조회에 실패했습니다.");
			return "common/errorPage";
		}
		
		
		// 좌석 별 가격 조회
		Object vipPrice= (Object) session.getAttribute("vipPrice");
		Object rPrice= (Object)session.getAttribute("rPrice");
		Object sPrice= (Object)session.getAttribute("sPrice");
		
		model.addAttribute("vipPrice",vipPrice);
		model.addAttribute("rPrice",rPrice);
		model.addAttribute("sPrice",sPrice);
		
		return "reservation/seats";
		
	}
	
	@Transactional
	@ResponseBody
	@PostMapping("/selectedSeats")
	public int selectedSeats(HttpSession session, int num ,String selectedName, int roundId) {
		
		 // 좌석 상태 변환
		 int result2 = 0;
		 String[] seatArray = selectedName.split(","); 
		
		 for(String name : seatArray) {
			 
			Map<String, Object> seats = new HashMap<>();
			
			seats.put("name", name);
			seats.put("roundId", roundId);
		    int result = reservationService.updateSeatStatus(seats);
	        if (result == 0) {
	        	System.out.println ("좌석 상태 변환에 실패하였습니다. : " + name);
	        	return 0;
	        }
	        result2 += result;
		 }
		 
		 if(num==result2) {
			 session.setAttribute("num", num);
			 session.setAttribute("selectedName", selectedName);
			 return num;
		 }else {
			 return 0;
		 }
	}
	
	
	
}
	

