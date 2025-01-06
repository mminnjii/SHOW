package com.kh.show.chat.model.vo;

import java.sql.Date;

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
}
