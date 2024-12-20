package com.kh.show.mainview.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public class MainController {

	@ResponseBody
	@RequestMapping(value="musicalList",produces="application/json;charset=UTF-8")
	public String musicalList() {
		

		
		
		return null;
	}
}
