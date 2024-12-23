package com.kh.show.reservation.model.vo;

import java.sql.Date;

import com.kh.show.payments.model.vo.Payments;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Seats {
	private int seatId;	//	SEAT_ID
	private int hallNo;	//	HALL_NO
	private String seatName;	//	SEAT_NAME
	private String rowNum;	//	ROW_NUM
	private String status;	//	STATUS
}
