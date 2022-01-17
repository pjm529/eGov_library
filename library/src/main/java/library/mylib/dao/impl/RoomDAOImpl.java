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

}
