package com.kh.show.showInfo.model.vo;

import lombok.Data;

@Data
public class ManagerUpdateShow {
	private int showNo;
	private String showName;
	private String showExplain;
	private String price;
	private String notice;
	private String hallName;
	private String genreName;
	private String regionName;
	private String showStart;
	private String showEnd;
	private String posterChangeName;
	private String detailChangeName;
	private String posterPath;
	private String detailPath;
}
