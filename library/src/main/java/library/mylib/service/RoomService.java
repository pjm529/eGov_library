package library.mylib.service;

import java.util.List;

import library.mylib.domain.RoomVO;

public interface RoomService {

	// 회원 예약 정보
	public RoomVO mySeatInfo(String userId);

	// 제 1열람실 출력
	public List<RoomVO> readingRoom1List();

	// 제 2열람실 출력
	public List<RoomVO> readingRoom2List();

	// 노트북실 출력
	public List<RoomVO> nbRoomList();

	// 열람실 좌석 상태 체크
	public int seatCheck(int seatNo);

	// 열람실 좌석 에약
	public void bookingSeat(RoomVO room);

	// 열람실 좌석 반납
	public void returnSeat(String userId);

	// 열람실 좌석 연장
	public void extendSeat(String userId);

}
