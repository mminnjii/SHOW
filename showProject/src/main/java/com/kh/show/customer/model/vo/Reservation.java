package com.kh.show.customer.model.vo;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
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

}