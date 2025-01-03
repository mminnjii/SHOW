package com.kh.show.member.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Reserveshow {
	private String reservationId;//	RESERVATION_ID,
	private String showName;//    SHOW_NAME,
	private String roundId;//    ROUND_ID,
	private String hallName;//    H.HALL_NAME,
	private String regionName;//    RE.REGION_NAME,
	private String genreName;//    G.GENRE_NAME,
	private String price;//    S.PRICE,
	private Date createDate;//    CREATEDATE,
	private String posterOriginName;//    POSTER_ORIGINNAME
}
