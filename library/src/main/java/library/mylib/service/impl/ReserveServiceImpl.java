package library.mylib.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.mylib.dao.ReserveDAO;
import library.mylib.service.ReserveService;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveDAO reserveDAO;

	// 열람실 잔여 좌석
	@Override
	public int usingSeat(String roomType) {

		if (roomType.equals("room1")) {
			return reserveDAO.rd1UsingSeat();
		} else if (roomType.equals("room2")) {
			return reserveDAO.rd2UsingSeat();
		} else {
			return reserveDAO.nbUsingSeat();
		}

	}

	// 열람실 사용 중 좌석
	@Override
	public int usedSeat(String roomType) {

		if (roomType.equals("room1")) {
			return reserveDAO.rd1UsedSeat();
		} else if (roomType.equals("room2")) {
			return reserveDAO.rd2UsedSeat();
		} else {
			return reserveDAO.nbUsedSeat();
		}
	}

}
