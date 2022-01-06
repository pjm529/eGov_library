package library.mylib.dao;

import java.util.HashMap;
import java.util.List;

import library.search.domain.BookVO;

public interface MyLoanDAO {

	// 대출 내역 조회
	public List<BookVO> loanHistoryList(HashMap<String, Object> map);
	
	// 대출 총 권수
	public int historyTotal(HashMap<String, Object> map);
}
