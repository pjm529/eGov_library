package library.admin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.admin.dao.AdminHopeDAO;
import library.common.page.Criteria;
import library.mylib.domain.HopeVO;

@Repository
public class AdminHopeDAOImpl extends EgovAbstractMapper implements AdminHopeDAO {

	// 희망도서 신청내역
	@Override
	public List<HopeVO> hopeList(Criteria cri) {
		return selectList("AdminHope.hopeList", cri);
	}

	// 희망도서 신청 수
	@Override
	public int hopeTotal(Criteria cri) {
		return selectOne("AdminHope.hopeTotal", cri);
	}

	// 희망도서 신청 내역
	@Override
	public HopeVO hopeInfo(int hopeNo) {
		return selectOne("AdminHope.hopeInfo", hopeNo);
	}

}
