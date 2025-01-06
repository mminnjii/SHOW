package com.kh.show.member.model.vo;


import java.sql.Date;
import java.util.ArrayList;

import com.kh.show.showInfo.model.vo.Genre;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Coupon {
	private int couponNo;//	COUPON_NO	NUMBER
	private String couponName;//	COUPON_NAME	VARCHAR2(100 BYTE)	
	private String genreNo;//	GENRE_NO	NUMBER
	private int userNo;//	USER_NO	NUMBER
	private double discount;//	DISCOUNT	NUMBER
	private Date expiredDate;//	EXPIRED_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	private ArrayList<Genre> g;
}
