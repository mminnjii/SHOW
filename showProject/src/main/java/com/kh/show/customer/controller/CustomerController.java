package com.kh.show.customer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.show.customer.model.service.CustomerService;
import com.kh.show.customer.model.vo.Faq;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	
	
	@GetMapping("/cmain")
	public String cmain() {
		
		log.info("고객센터 페이지");
		
		return "customerService/customerService";
	}
	
	// faq 리스트
	@GetMapping("/faq")
	public String faqList(Model m){

		ArrayList<Faq> faqList = customerService.selectFaqList();

//		for(Faq f : faqList) {
//			System.out.println(f);
//		}
		
		m.addAttribute("faqList", faqList);
		
		return "customerService/faq";
	}
	
	// faq 카테고리별 리스트 
	@ResponseBody
	@GetMapping(value="/faqFilter", produces = "application/json; charset=UTF-8")
	public ArrayList<Faq> faqFilterList(String qcategoryNo, Model m) {
		
		ArrayList<Faq> faqList = null;
		
		// qcategoryNo의 값이 all 이면 전체 출력. 아니면 카테고리별로 출력.
		if(qcategoryNo.equals("all")) {
			faqList = customerService.selectFaqList();
		}else {			
			faqList = customerService.faqFilterList(qcategoryNo);
		}
		

		for(Faq f : faqList) {
			System.out.println(faqList);
		}
		
		return faqList;
	}
	
}
