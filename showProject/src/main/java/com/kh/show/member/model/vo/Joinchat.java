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
public class Joinchat {
	private int chatNo;
	private String chatTitle;	
	private int userNo;
	private String userId;
	private int chatUserCount;
	private Date createDate;
	private int joinCount;
}
