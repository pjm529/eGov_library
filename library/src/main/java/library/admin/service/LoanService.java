package library.admin.service;

import java.util.List;

import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.member.domain.MemberVO;
import library.search.domain.BookVO;

public interface LoanService {

	// 총 대출 내역 조회
	public List<BookVO> loanHistoryList(Criteria cri);

	// 총 대출 건 수
	public int historyTotal(Criteria cri);

	// 대출 중 내역 조회
	public List<BookVO> loanList(Criteria cri);

	// 대출 중 도서 건 수
	public int loanTotal(Criteria cri);

	// 도서 반납
	public void returnBook(int loanNo);

	// 연체 일 확인
	public int searchOverdue(int loanNo);

	// 반납 후 회원 정보 수정
	public void modifyMemberInfo(String userId, int date);

	// 연체 리스트 조회
	public List<BookVO> overdueList();

	// 연체 도서 건 수
	public int overdueTotal();

	// 회원 대출 순위
	public List<MemberVO> rankList(DateVO date);
}
