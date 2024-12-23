package com.kh.show.customer.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Faq {
	
	private int faqNo ;				//FAQ_NO	NUMBER
	private String faqTitle; 		//FAQ_TITLE	VARCHAR2(500 BYTE)
	private String faqContent; 		//FAQ_CONTENT	VARCHAR2(2000 BYTE)
	private String qcategoryNo;	 	//QCATEGORY_NO	VARCHAR2(100 BYTE)
	private int count;
	
}
