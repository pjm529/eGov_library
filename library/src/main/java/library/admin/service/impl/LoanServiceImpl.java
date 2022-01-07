package library.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.admin.dao.LoanDAO;
import library.admin.service.LoanService;
import library.common.page.Criteria;
import library.search.domain.BookVO;

@Service
public class LoanServiceImpl implements LoanService {

	@Autowired
	private LoanDAO loanDAO;

	// 총 대출 내역 조회
	@Override
	public List<BookVO> loanHistoryList(Criteria cri) {
		return loanDAO.loanHistoryList(cri);
	}

	// 총 대출 건 수
	@Override
	public int historyTotal(Criteria cri) {
		return loanDAO.historyTotal(cri);
	}

	// 대출 중 내역 조회
	@Override
	public List<BookVO> loanList(Criteria cri) {
		return loanDAO.loanList(cri);
	}

	// 대출 중 도서 건 수
	@Override
	public int loanTotal(Criteria cri) {
		return loanDAO.loanTotal(cri);
	}

	// 도서 반납
	@Override
	public void returnBook(int loanNo) {
		loanDAO.returnBook(loanNo);
	}

	// 연체 일 확인
	@Override
	public int searchOverdue(int loanNo) {
		return loanDAO.searchOverdue(loanNo);
	}

	// 반납 후 회원 정보 수정
	@Override
	public void modifyMemberInfo(String userId, int date) {

		HashMap<String, Object> map = new HashMap<>();

		map.put("userId", userId);
		map.put("date", date);

		loanDAO.modifyMemberInfo(map);
	}

	// 연체 리스트 조회
	@Override
	public List<BookVO> overdueList() {
		return loanDAO.overdueList();
	}

	// 연체 도서 건 수
	@Override
	public int overdueTotal() {
		return loanDAO.overdueTotal();
	}

}
