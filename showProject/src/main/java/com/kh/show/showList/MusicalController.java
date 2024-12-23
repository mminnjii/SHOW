package com.kh.show.showList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.show.mainview.vo.show;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller

public class MusicalController {
	
	@RequestMapping("/musicalList")
	public String showMusicalList() {
	    return "/showList/musicalList"; // musicalList.jsp로 이동
	}
	
	@RequestMapping(value="musicalShow")
	public void musicalShow(HttpServletResponse response) {
		
		
		
		
		
	}

}
