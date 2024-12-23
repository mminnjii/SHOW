package com.kh.show.payments.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cerditcard {
	private int paymentId;//	PAYMENT_ID
	private int userNo; //	USER_NO
}
