package com.kh.show.showInfo.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.show.showInfo.model.service.ShowInfoService;
import com.kh.show.showInfo.model.vo.Show;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ShowListController {
	
	@Autowired
	private ShowInfoService showInfoService;
	
	
	@RequestMapping(value="mainRegionRank",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> mainRegionRank() {
		
		ArrayList<Show> mainRegionRank = showInfoService.mainRegionRank();
		
		
		return mainRegionRank;
		
		
		
	}
	
	
	
	
	
	//뮤지컬 리스트 페이지로 이동 
	@RequestMapping("/musicalList")
	public String showMusicalList() {
	    return "/showList/musicalList"; 
	}
	
	
	
			
	
	@RequestMapping(value="musicalShow",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> musicalShow() {
		
		ArrayList<Show> musicalShowList = showInfoService.musicalShow();
		
		//System.out.println(musicalShowList);
		
		return musicalShowList;
		
		
		
	}
	
	@GetMapping(value="musicalRegion0",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> musicalRegion0(){
		
		ArrayList<Show> musicalRegionList = showInfoService.musicalRegion0();
		
		//System.out.println("music : "+musicalRegionList);
		
		return musicalRegionList;
		
	}
	
	
	@GetMapping(value="musicalRegion1",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> musicalRegion(){
		
		ArrayList<Show> musicalRegionList = showInfoService.musicalRegion();
		
		//System.out.println("music : "+musicalRegionList);
		
		return musicalRegionList;
		
	}
	
	@GetMapping(value="musicalRegion2",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> musicalRegion2(){
		
		ArrayList<Show> musicalRegionList2 = showInfoService.musicalRegion2();
		
		
		return musicalRegionList2;
		
	}
	
	
	@GetMapping(value="musicalRegion3",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> musicalRegion3(){
		
		ArrayList<Show> musicalRegionList3 = showInfoService.musicalRegion3();
		
		
		return musicalRegionList3;
		
	}
	
	@GetMapping(value="musicalRegion4",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> musicalRegion4(){
		
		ArrayList<Show> musicalRegionList4 = showInfoService.musicalRegion4();
		
		
		return musicalRegionList4;
		
	}
	
	@GetMapping(value="musicalRegion5",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> musicalRegion5(){
		
		ArrayList<Show> musicalRegionList5 = showInfoService.musicalRegion5();
		
		
		return musicalRegionList5;
		
	}
	
	@GetMapping(value="musicalRegion6",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> musicalRegion6(){
		
		ArrayList<Show> musicalRegionList6 = showInfoService.musicalRegion6();
		
		
		return musicalRegionList6;
		
	}
	
	
	//연극 리스트 페이지로 이동
	@RequestMapping("/playList")
	public String showPlayList() {
	    return "/showList/playList"; 
	}
	
	
	@RequestMapping(value="playShow",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> playShow() {
		
		ArrayList<Show> playShowList = showInfoService.playShow();
		
		//System.out.println(musicalShowList);
		
		return playShowList;
		
		
		
	}
	
	@GetMapping(value="playRegion0",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> playRegion0(){
		
		ArrayList<Show> playRegionList0 = showInfoService.playRegion0();
		
		
		return playRegionList0;
		
	}
	
	@GetMapping(value="playRegion1",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> playRegion1(){
		
		ArrayList<Show> playRegionList1 = showInfoService.playRegion1();
		
		
		return playRegionList1;
		
	}
	
	@GetMapping(value="playRegion2",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> playRegion2(){
		
		ArrayList<Show> playRegionList2 = showInfoService.playRegion2();
		
		
		return playRegionList2;
		
	}
	
	
	@GetMapping(value="playRegion3",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> playRegion3(){
		
		ArrayList<Show> playRegionList3 = showInfoService.playRegion3();
		
		
		return playRegionList3;
		
	}
	
	@GetMapping(value="playRegion4",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> playRegion4(){
		
		ArrayList<Show> playRegionList4 = showInfoService.playRegion4();
		
		
		return playRegionList4;
		
	}
	
	@GetMapping(value="playRegion5",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> playRegion5(){
		
		ArrayList<Show> playRegionList5 = showInfoService.playRegion5();
		
		
		return playRegionList5;
		
	}
	
	@GetMapping(value="playRegion6",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> playRegion6(){
		
		ArrayList<Show> playRegionList6 = showInfoService.playRegion6();
		
		
		return playRegionList6;
		
	}
	
	//콘서트 리스트 페이지로 이동
	@RequestMapping("/concertList")
	public String showConcertList() {
      return "/showList/concertList"; 
		}
		
	@RequestMapping(value="concertShow",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> concertShow() {
			
		ArrayList<Show> concertShowList = showInfoService.concertShow();
			
			
		return concertShowList;
			
			
			
		}
	
	@GetMapping(value="concertRegion0",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> concertRegion0(){
		
		ArrayList<Show> concertRegionList0 = showInfoService.concertRegion0();
		
		
		return concertRegionList0;
		
	}
	
	@GetMapping(value="concertRegion1",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> concertRegion1(){
		
		ArrayList<Show> concertRegionList1 = showInfoService.concertRegion1();
		
		
		return concertRegionList1;
		
	}
	
	@GetMapping(value="concertRegion2",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> concertRegion2(){
		
		ArrayList<Show> concertRegionList2 = showInfoService.concertRegion2();
		
		
		return concertRegionList2;
		
	}
	
	
	@GetMapping(value="concertRegion3",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> concertRegion3(){
		
		ArrayList<Show> concertRegionList3 = showInfoService.concertRegion3();
		
		
		return concertRegionList3;
		
	}
	
	@GetMapping(value="concertRegion4",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> concertRegion4(){
		
		ArrayList<Show> concertRegionList4 = showInfoService.concertRegion4();
		
		
		return concertRegionList4;
		
	}
	
	@GetMapping(value="concertRegion5",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> concertRegion5(){
		
		ArrayList<Show> concertRegionList5 = showInfoService.concertRegion5();
		
		
		return concertRegionList5;
		
	}
	
	@GetMapping(value="concertRegion6",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> concertRegion6(){
		
		ArrayList<Show> concertRegionList6 = showInfoService.concertRegion6();
		
		
		return concertRegionList6;
		
	}
	
	//클래식 리스트 페이지로 이동
	@RequestMapping("/classicList")
	public String showclassicList() {
	     return "/showList/classicList"; 
		}
	
	
	@RequestMapping(value="classicShow",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> classicShow() {
			
		ArrayList<Show> classicShowList = showInfoService.classicShow();
			
			
		return classicShowList;
			
			
			
		}
	
	@GetMapping(value="classicRegion0",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> classicRegion0(){
		
		ArrayList<Show> classicRegion0 = showInfoService.classicRegion0();
		
		//System.out.println(classicRegion1);
		
		return classicRegion0;
		
	}
	
	
	@GetMapping(value="classicRegion1",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> classicRegion1(){
		
		ArrayList<Show> classicRegion1 = showInfoService.classicRegion1();
		
		//System.out.println(classicRegion1);
		
		return classicRegion1;
		
	}
	
	@GetMapping(value="classicRegion2",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> classicRegion2(){
		
		ArrayList<Show> classicRegion2 = showInfoService.classicRegion2();
		
		//System.out.println(classicRegion2);
		
		return classicRegion2;
		
	}
	
	
	@GetMapping(value="classicRegion3",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> classicRegion3(){
		
		ArrayList<Show> classicRegion3 = showInfoService.classicRegion3();
		
		
		return classicRegion3;
		
	}
	
	@GetMapping(value="classicRegion4",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> classicRegion4(){
		
		ArrayList<Show> classicRegion4 = showInfoService.classicRegion4();
		
		
		return classicRegion4;
		
	}
	
	@GetMapping(value="classicRegion5",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> classicRegion5(){
		
		ArrayList<Show> classicRegion5 = showInfoService.classicRegion5();
		
		
		return classicRegion5;
		
	}
	
	@GetMapping(value="classicRegion6",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ArrayList<Show> classicRegion6(){
		
		ArrayList<Show> classicRegion6 = showInfoService.classicRegion6();
		
		
		return classicRegion6;
		
	}
	
	//전시 리스트 페이지로 이동
		@RequestMapping("/displayList")
		public String showDisplayList() {
		     return "/showList/displayList"; 
			}
		
		
		@RequestMapping(value="displayShow",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<Show> displayShow() {
				
			ArrayList<Show> displayShow = showInfoService.displayShow();
				
				
			return displayShow;
				
				
				
			}
		
		@GetMapping(value="displayRegion0",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<Show> displayRegion0(){
			
			ArrayList<Show> displayRegion0 = showInfoService.displayRegion0();
			
			
			return displayRegion0;
			
		}
		
		
		@GetMapping(value="displayRegion1",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<Show> displayRegion1(){
			
			ArrayList<Show> displayRegion1 = showInfoService.displayRegion1();
			
			
			return displayRegion1;
			
		}
		
		@GetMapping(value="displayRegion2",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<Show> displayRegion2(){
			
			ArrayList<Show> displayRegion2 = showInfoService.displayRegion2();
			
			
			return displayRegion2;
			
		}
		
		
		@GetMapping(value="displayRegion3",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<Show> displayRegion3(){
			
			ArrayList<Show> displayRegion3 = showInfoService.displayRegion3();
			
			
			return displayRegion3;
			
		}
		
		@GetMapping(value="displayRegion4",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<Show> displayRegion4(){
			
			ArrayList<Show> displayRegion4 = showInfoService.displayRegion4();
			
			
			return displayRegion4;
			
		}
		
		@GetMapping(value="displayRegion5",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<Show> displayRegion5(){
			
			ArrayList<Show> displayRegion5 = showInfoService.displayRegion5();
			
			
			return displayRegion5;
			
		}
		
		@GetMapping(value="displayRegion6",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<Show> displayRegion6(){
			
			ArrayList<Show> displayRegion6 = showInfoService.displayRegion6();
			
			
			return displayRegion6;
			
		}
	
		@Scheduled
		@GetMapping(value="rankShowList",produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ArrayList<Show> rankShowList() {
			
			ArrayList<Show> rankShowList = showInfoService.rankShowList();
			
			//System.out.println("Rank Show List: " + rankShowList);
			
			return rankShowList;
		}

}
