package com.kh.show.showInfo.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.show.showInfo.model.service.ShowInfoService;
import com.kh.show.showInfo.model.vo.Show;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MusicalController {
	
	@Autowired
	private ShowInfoService showInfoService;
	
	@RequestMapping("/musicalList")
	public String showMusicalList() {
	    return "/showList/musicalList"; // musicalList.jsp로 이동
	}
	
	@RequestMapping(value="musicalShow",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> musicalShow() {
		
		ArrayList<Show> musicalShowList = showInfoService.musicalShow();
		
		System.out.println(musicalShowList);
		
		return musicalShowList;
		
		
		
	}

}
