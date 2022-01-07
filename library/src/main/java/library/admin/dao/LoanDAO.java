package library.admin.dao;

import java.util.List;

import library.common.page.Criteria;
import library.search.domain.BookVO;

public interface LoanDAO {

	// 총 대출 내역 조회
	public List<BookVO> loanHistoryList(Criteria cri);

	// 총 대출 건 수
	public int historyTotal(Criteria cri);

	// 대출 중 내역 조회
	public List<BookVO> loanList(Criteria cri);

	// 대출 중 도서 건 수
	public int loanTotal(Criteria cri);

}
