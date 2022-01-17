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

}
