package library.mylib.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.mylib.dao.HopeDAO;
import library.mylib.domain.HopeVO;

@Repository
public class HopeDAOImpl extends EgovAbstractMapper implements HopeDAO {

	// 희망도서 신청
	@Override
	public void insertHope(HopeVO hope) {
		insert("Hope.insertHope", hope);
	}

	// 희망도서 신청 내역
	@Override
	public List<HopeVO> hopeList(HashMap<String, Object> map) {
		return selectList("Hope.hopeList", map);
	}

	// 희망도서 신청 수
	@Override
	public int hopeTotal(HashMap<String, Object> map) {
		return selectOne("Hope.hopeTotal", map);
	}

}
