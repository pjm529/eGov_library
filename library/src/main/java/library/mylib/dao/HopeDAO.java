package library.mylib.dao;

import java.util.HashMap;
import java.util.List;

import library.mylib.domain.HopeVO;

public interface HopeDAO {
	
	// 희망도서 신청
	public void insertHope(HopeVO hope);
	
	// 희망도서 신청 내역
	public List<HopeVO> hopeList(HashMap<String, Object> map);
	
	// 희망도서 신청 수
	public int hopeTotal(HashMap<String, Object> map);

}
