package library.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.admin.dao.AdminHopeDAO;
import library.admin.service.AdminHopeService;
import library.common.page.Criteria;
import library.mylib.domain.HopeVO;

@Service
public class AdminHopeServiceImpl implements AdminHopeService {

	@Autowired
	private AdminHopeDAO hopeDAO;

	// 희망도서 신청내역
	@Override
	public List<HopeVO> hopeList(Criteria cri) {
		return hopeDAO.hopeList(cri);
	}

	// 희망도서 신청 수
	@Override
	public int hopeTotal(Criteria cri) {
		return hopeDAO.hopeTotal(cri);
	}

	// 희망도서 신청 내역
	@Override
	public HopeVO hopeInfo(int hopeNo) {
		return hopeDAO.hopeInfo(hopeNo);
	}

}
