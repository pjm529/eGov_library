package library.mylib.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RoomVO {

	// 좌석 번호
	private int seatNo;

	// 예약자 id
	private String userId;

	// 입실 시간
	private Timestamp checkinTime;

	// 퇴실 시간
	private Timestamp checkoutTime;

	// 잔여 시간
	private long diffTime;
}
