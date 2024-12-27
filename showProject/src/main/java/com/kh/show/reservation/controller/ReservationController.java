package com.kh.show.reservation.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.show.reservation.model.service.ReservationService;
import com.kh.show.reservation.model.vo.SeatsOfRow;
import com.kh.show.showInfo.model.vo.Show;

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
		System.out.println(roundId);
		
		
		// status "N"인 좌석 조회
		ArrayList<String> taken= reservationService.selectTakenSeats();  
		Gson gson = new Gson();
		model.addAttribute("taken",gson.toJson(taken));
		
		// 등급별 좌석 수 조회
		ArrayList<SeatsOfRow> num  = reservationService.selectSeatsNum();  
		model.addAttribute("num", num);
		return "reservation/seats";
	}
	
	
	@ResponseBody
	@PostMapping("/selectedSeats")
	public int selectedSeats(HttpSession session, int num ,String selectedName) {
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
			 
		    int result = reservationService.updateSeatStatus(name);
	        if (result == 0) {
	        	System.out.println ("좌석 상태 변환에 실패하였습니다. : " + name);
	        }
	        result2 += result;
		 }
		 
		 if(num==result2 && result1>0) {
			 return num;
		 }else {
			 return 0;
		 }
		 
		 // 예약테이블 데이터 생성
		 
		 
		 
	}
	
	
	
}
	

