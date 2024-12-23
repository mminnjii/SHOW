package com.kh.show.showInfo.model.vo;

import java.sql.Date;

import com.kh.show.reservation.model.vo.Reservation;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DetailAttachement {
	
	private int fileNO; //	FILE_NO
	private int showNo; //	SHOW_NO
	private String originName; //	ORIGIN_NAME
	private String changeName; //	CHANGE_NAME
	private String filePath;//	FILE_PATH
	private String fileLevel;//	FILE_LEVEL
	private String uploadDate;//	UPLOAD_DATE
	private String status;//	STATUS
		
	
}
