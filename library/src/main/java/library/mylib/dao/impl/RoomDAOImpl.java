package library.mylib.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.mylib.dao.RoomDAO;
import library.mylib.domain.RoomVO;

@Repository
public class RoomDAOImpl extends EgovAbstractMapper implements RoomDAO {

	// 회원 예약 정보
	@Override
	public RoomVO mySeatInfo(String userId) {
		return selectOne("Room.mySeatInfo", userId);
	}

	// 제 1열람실 출력
	@Override
	public List<RoomVO> readingRoom1List() {
		return selectList("Room.readingRoom1List");
	}

	// 제 2열람실 출력
	@Override
	public List<RoomVO> readingRoom2List() {
		return selectList("Room.readingRoom2List");
	}

	// 노트북실 출력
	@Override
	public List<RoomVO> nbRoomList() {
		return selectList("Room.nbRoomList");
	}

	// 열람실 좌석 상태 체크
	@Override
	public int seatCheck(int seatNo) {
		return selectOne("Room.seatCheck", seatNo);
	}

	// 열람실 좌석 에약
	@Override
	public void bookingSeat(RoomVO room) {
		update("Room.bookingSeat", room);
	}

	// 열람실 좌석 반납
	@Override
	public void returnSeat(String userId) {
		update("Room.returnSeat", userId);
	}

	// 열람실 좌석 연장
	@Override
	public void extendSeat(String userId) {
		update("Room.extendSeat", userId);
	}

}
