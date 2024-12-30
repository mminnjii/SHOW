package com.kh.show.reservation.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.show.reservation.model.service.ReservationService;
import com.kh.show.reservation.model.vo.Reservation;
import com.kh.show.reservation.model.vo.SeatsOfRow;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
//	
//	@Autowired
//	private SchedulerTest sc;
	
	
	// 좌석이동
	@GetMapping("/seats")
	public String seats(Model model,int showNo, int roundId, int hallNo) {
		
		// reservation 생성
		// (예약번호 / 공연번호 / 회차번호 / 회원번호 / 공연장번호 / 예약상태)
		Map<String, Object> r = new HashMap<>();
        r.put("showNo", showNo);
        r.put("roundId", roundId);
        r.put("hallNo", hallNo);
		
		int result = reservationService.createReservation(r);  
		
		if(result>0) {
			Reservation rInfo = reservationService.selectReservation();
			model.addAttribute("rInfo",rInfo);
			
		}else {
			model.addAttribute("alert","예약이 생성되지 못했습니다. 다시 선택해주세요");
		}
		
		
		// status "N"인 좌석 조회
		ArrayList<String> taken= reservationService.selectTakenSeats(roundId);  
		Gson gson = new Gson();
		model.addAttribute("taken",gson.toJson(taken));
		
		// 등급별 좌석 수 조회
		ArrayList<SeatsOfRow> num  = reservationService.selectSeatsNum(roundId);  
		model.addAttribute("num", num);
		return "reservation/seats";
		
	}
	
	
	@ResponseBody
	@PostMapping("/selectedSeats")
	public int selectedSeats(HttpSession session, int num ,String selectedName, int roundId) {
		 // System.out.println(num);
		 // System.out.println(selectedName);
		 // session.setAttribute("num", num);
		//  session.setAttribute("selectedName", selectedName);
		

		
		 // 공연장(hall)테이블 총좌석 수 변환(-).
		 int result1 = reservationService.updateTotalNum(num); 
		 
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
	        }
	        result2 += result;
		 }
		 
		 if(num==result2 && result1>0) {
			 
			 session.setAttribute("num", num);
			 session.setAttribute("selectedName", selectedName);
			 
			 return num;
		 }else {
			 return 0;
		 }
		 
		
		 
		 
		 
	}
	
	
	
}
	

