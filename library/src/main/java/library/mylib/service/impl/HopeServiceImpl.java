package library.mylib.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.common.page.Criteria;
import library.mylib.dao.HopeDAO;
import library.mylib.domain.HopeVO;
import library.mylib.service.HopeService;

@Service
public class HopeServiceImpl implements HopeService {

	@Autowired
	private HopeDAO hopeDAO;

	// 희망도서 신청
	@Override
	public void insertHope(HopeVO hope) {
		hopeDAO.insertHope(hope);
	}

	// 희망도서 신청내역
	@Override
	public List<HopeVO> hopeList(Criteria cri, String userId) {
		HashMap<String, Object> map = new HashMap<>();

		map.put("cri", cri);
		map.put("userId", userId);

		return hopeDAO.hopeList(map);
	}

	// 희망도서 신청 수
	@Override
	public int hopeTotal(Criteria cri, String userId) {
		HashMap<String, Object> map = new HashMap<>();

		map.put("cri", cri);
		map.put("userId", userId);

		return hopeDAO.hopeTotal(map);
	}

	// 희망도서 신청 정보
	@Override
	public HopeVO hopeInfo(HopeVO hope) {
		return hopeDAO.hopeInfo(hope);
	}

}
