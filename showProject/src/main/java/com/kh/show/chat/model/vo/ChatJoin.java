package com.kh.show.chat.model.vo;

import java.sql.Date;

import com.kh.show.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatJoin {
	private int chatNo;		//CHAT_NO	NUMBER
	private int userNo;		//USER_NO	NUMBER
	
	private Member member;
}
