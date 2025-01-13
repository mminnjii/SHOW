package com.kh.show.showInfo.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ManagerShowInfo {
	private int showNo;
	private String showName;
	private String showExplain;
	private String price;
	private String hallName;
	private String genreName;
	private String regionName;
	private String showStart;
	private String showEnd;
	private int count;
}
