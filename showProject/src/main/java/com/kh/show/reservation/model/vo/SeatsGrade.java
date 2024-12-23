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
public class SeatsGrade {
	private int seatId;	//	SEAT_ID
	private String gradeName;	//	GRADE_NAME
	private String price;	//	PRICE
}
