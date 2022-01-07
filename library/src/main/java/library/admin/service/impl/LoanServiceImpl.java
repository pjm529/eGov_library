package library.admin.service.impl;

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
		// TODO Auto-generated method stub
		return loanDAO.loanTotal(cri);
	}

}
