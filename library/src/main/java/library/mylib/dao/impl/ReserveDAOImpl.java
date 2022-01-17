package library.mylib.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.mylib.dao.ReserveDAO;

@Repository
public class ReserveDAOImpl extends EgovAbstractMapper implements ReserveDAO {

	// 제 1열람실 잔여 좌석
	@Override
	public int rd1UsingSeat() {
		return selectOne("Reserve.rd1UsingSeat");
	}

	// 제 1열람실 사용 중 좌석
	@Override
	public int rd1UsedSeat() {
		return selectOne("Reserve.rd1UsedSeat");
	}

	// 제 2열람실 잔여 좌석
	@Override
	public int rd2UsingSeat() {
		return selectOne("Reserve.rd2UsingSeat");
	}

	// 제 2열람실 사용 중 좌석
	@Override
	public int rd2UsedSeat() {
		return selectOne("Reserve.rd2UsedSeat");
	}

	// 노트북실 잔여 좌석
	@Override
	public int nbUsingSeat() {
		return selectOne("Reserve.nbUsingSeat");
	}

	// 노트북실 사용 중 좌석
	@Override
	public int nbUsedSeat() {
		return selectOne("Reserve.nbUsedSeat");
	}

}
