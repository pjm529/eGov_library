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

	// 대출 중 도서 내역
	public List<BookVO> loanList(String userId);

	// 대출 중 도서 건수
	public int loanTotal(String userId);

	// 회원 연체 도서 수
	public int overdueCount(String userId);

	// 회원 대출 정지 일
	public int myOverdueDate(String userId);
}
