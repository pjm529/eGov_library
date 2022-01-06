package library.mylib.service;

import java.util.List;

import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.search.domain.BookVO;

public interface MyLoanService {

	// 대출 내역 조회
	public List<BookVO> loanHistoryList(String userId, Criteria cri, DateVO date);

	// 대출 총 권수
	public int historyTotal(String userId, DateVO date);
}
