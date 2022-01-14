package library.mylib.dao.impl;

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

}
