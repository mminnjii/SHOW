package com.kh.show.payments.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Creditcard {
	private int paymentId;//	PAYMENT_ID
	private int userNo; //	USER_NO
}
