package com.kh.show.reservation.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ManagerPageReservation2 {
	private int reservationId;
	private int showNo;
    private String showName;
    private int roundId;
    private String userName;
    private String userId;
    private String hallName;
    private Date createDate;
    private String precaution;
}

