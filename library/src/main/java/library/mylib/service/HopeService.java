package library.mylib.service;

import java.util.List;

import library.common.page.Criteria;
import library.mylib.domain.HopeVO;

public interface HopeService {

	// 희망도서 신청
	public void insertHope(HopeVO hope);

	// 희망도서 신청 내역
	public List<HopeVO> hopeList(Criteria cri, String userId);
	
	// 희망도서 신청 수
	public int hopeTotal(Criteria cri, String userId);
}
