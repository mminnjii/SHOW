package com.kh.show.reservation.model.vo;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.kh.show.showInfo.model.vo.Genre;
import com.kh.show.showInfo.model.vo.Hall;
import com.kh.show.showInfo.model.vo.Region;
import com.kh.show.showInfo.model.vo.Show;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Reservation {

	private int reservationId;	//	RESERVATION_ID
	private int showNo;			//	SHOW_NO
	private String showName;	// 사용을 위해 추가 (컬렉션 쓰기엔 적은데이터로 판단)
	private int roundId;		//	ROUND_ID
	private int showRound;		// 사용을 위해 추가
	private int userNo;			//	USER_NO
	private String hallNo;			//	HALL_NO
//	private String regionName;
	private String price;
//	private String posterOriginName;
	private String hallName;    // 사용을 위해 추가
	private String status;		//	STATUS
	private String showTime;	// 사용을 위해 추가	
	private String showStart;
	private Date showDate;	// 사용을 위해 추가	
	private Date createDate;	//	CREATEDATE
	private String precaution;	//	PRECAUTION
	
	private List<String> seats; 
	
	// mapper에서 collection 이용하기 위해 사용.
	private ArrayList<Show> showList;
	private ArrayList<Hall> hallList;
	private ArrayList<Region> regionList;
	private ArrayList<Genre> genreList;
}