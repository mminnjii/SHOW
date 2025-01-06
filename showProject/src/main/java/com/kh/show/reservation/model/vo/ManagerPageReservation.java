package com.kh.show.reservation.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ManagerPageReservation {
	private int reservationId;
    private String showName;
    private int roundId;
    private String userName;
    private String status;
    private String hallName;
    private Date createDate;
}
