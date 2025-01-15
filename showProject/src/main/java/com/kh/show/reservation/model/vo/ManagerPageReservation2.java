package com.kh.show.reservation.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
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

