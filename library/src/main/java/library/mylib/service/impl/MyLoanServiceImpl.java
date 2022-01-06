package library.mylib.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.mylib.dao.MyLoanDAO;
import library.mylib.service.MyLoanService;
import library.search.domain.BookVO;

@Service
public class MyLoanServiceImpl implements MyLoanService {

	@Autowired
	private MyLoanDAO myLoanDAO;

	// 대출 내역 조회
	@Override
	public List<BookVO> loanHistoryList(String userId, Criteria cri, DateVO date) {

		HashMap<String, Object> map = new HashMap<>();

		map.put("userId", userId);
		map.put("cri", cri);
		map.put("date", date);

		return myLoanDAO.loanHistoryList(map);
	}

	// 대출 총 권수
	@Override
	public int historyTotal(String userId, DateVO date) {

		HashMap<String, Object> map = new HashMap<>();

		map.put("userId", userId);
		map.put("date", date);

		return myLoanDAO.historyTotal(map);
	}

	// 대출 중 도서 내역
	@Override
	public List<BookVO> loanList(String userId) {
		return myLoanDAO.loanList(userId);
	}

	// 대출 중 도서 건수
	@Override
	public int loanTotal(String userId) {
		return myLoanDAO.loanTotal(userId);
	}

	// 회원 연체 도서 수
	@Override
	public int overdueCount(String userId) {
		return myLoanDAO.overdueCount(userId);
	}

	// 회원 대출 정지 일
	@Override
	public int myOverdueDate(String userId) {
		return myLoanDAO.myOverdueDate(userId);
	}

}
