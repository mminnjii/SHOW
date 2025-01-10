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
public class ChatMessage {
	private int messageNo;			//MESSAGE_NO	NUMBER
	private String chatContent;		//CHAT_CONTENT	VARCHAR2(2000 BYTE)
	private int userNo;				//USER_NO	NUMBER
	private int  chatNo;			//CHAT_NO	NUMBER
	private Date createDate;		//CREATEDATE	DATE

	private Member member;
	
}
