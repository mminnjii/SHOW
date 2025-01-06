package com.kh.show.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reserveshow {
	private int ticketId;
	private int seatId;	//	SEAT_ID
	private String reservationId;//	RESERVATION_ID,
	private String showName;//    SHOW_NAME,
	private String roundId;//    ROUND_ID,
	private String hallName;//    H.HALL_NAME,
	private String regionName;//    RE.REGION_NAME,
	private String genreName;//    G.GENRE_NAME,
	private String price;//    S.PRICE,
	private Date createDate;//    CREATEDATE,
	private String posterOriginName;//    POSTER_ORIGINNAME
	private int colNo;
	private String rowName;
}
