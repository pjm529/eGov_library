package library.mylib.service;

import java.util.List;

import library.mylib.domain.RoomVO;

public interface RoomService {

	// 회원 예약 정보
	public RoomVO mySeatInfo(String userId);

	// 제 1열람실 출력
	public List<RoomVO> readingRoom1List();
}
