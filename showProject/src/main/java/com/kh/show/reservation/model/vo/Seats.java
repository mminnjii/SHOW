package com.kh.show.reservation.model.vo;



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
	private String rowName; //	ROW_NAME
	private int roundId; //	RoundId
	private int colNum;		//	COL_NO
	private String status;	//	STATUS
	// private int count;	//	db에는 없지만 좌석 수 확인용 필드 추가
}
