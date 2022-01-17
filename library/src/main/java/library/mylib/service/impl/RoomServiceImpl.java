package library.mylib.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.mylib.dao.RoomDAO;
import library.mylib.domain.RoomVO;
import library.mylib.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDAO roomDAO;

	// 회원 예약 정보
	@Override
	public RoomVO mySeatInfo(String userId) {
		return roomDAO.mySeatInfo(userId);
	}

	// 제 1열람실 출력
	@Override
	public List<RoomVO> readingRoom1List() {
		return roomDAO.readingRoom1List();
	}

	// 제 2열람실 출력
	@Override
	public List<RoomVO> readingRoom2List() {
		return roomDAO.readingRoom2List();
	}

	// 열람실 좌석 상태 체크
	@Override
	public int seatCheck(int seatNo) {
		return roomDAO.seatCheck(seatNo);
	}

	// 열람실 좌석 에약
	@Override
	public void bookingSeat(RoomVO room) {
		roomDAO.bookingSeat(room);
	}

	// 열람실 좌석 반납
	@Override
	public void returnSeat(String userId) {
		roomDAO.returnSeat(userId);
	}

	@Override
	public void extendSeat(String userId) {
		roomDAO.extendSeat(userId);
	}

}
