package library.admin.dao;

import java.util.List;

import library.common.page.Criteria;
import library.mylib.domain.HopeVO;

public interface AdminHopeDAO {
	
	// 희망도서 신청내역
	public List<HopeVO> hopeList(Criteria cri);
	
	// 희망도서 신청 수
	public int hopeTotal(Criteria cri);
	
	// 희망도서 신청 내역
	public HopeVO hopeInfo(int hopeNo);

}
