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
public class SeatsOfRow {
	private String rowName; //	ROW_NAME
	private String gradeName;	//	GRADE_NAME
	private String price;	//	PRICE
	private int count;	//	db에는 없지만 좌석 수 확인용 필드 추가
}
