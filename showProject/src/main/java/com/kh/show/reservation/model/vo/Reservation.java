package com.kh.show.reservation.model.vo;
import java.sql.Date;

import java.util.List;

import com.kh.show.showInfo.model.vo.Show;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reservation {
	private int reservationId;//	RESERVATION_ID
	private int showNo;//	SHOW_NO
	private int roundId;//	ROUND_ID
	private int userNo;//	USER_NO
	private int hallNo;//	HALL_NO
	private String status;//	STATUS
	private Date createDate;//	CREATEDATE
	private String precaution;//	PRECAUTION
	
	// mapper에서 collection 사용하기 위해 추가
	private List<Show> showList;
}





