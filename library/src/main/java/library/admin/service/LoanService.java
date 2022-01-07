package library.admin.service;

import java.util.List;

import library.common.page.Criteria;
import library.search.domain.BookVO;

public interface LoanService {
	
	// 총 대출 내역 조회
	public List<BookVO> loanHistoryList(Criteria cri);

	// 총 대출 건 수
	public int historyTotal(Criteria cri);
}
