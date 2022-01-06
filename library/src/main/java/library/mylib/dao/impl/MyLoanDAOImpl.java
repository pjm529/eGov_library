package library.mylib.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.mylib.dao.MyLoanDAO;
import library.search.domain.BookVO;

@Repository
public class MyLoanDAOImpl extends EgovAbstractMapper implements MyLoanDAO {

	// 대출 내역 조회
	@Override
	public List<BookVO> loanHistoryList(HashMap<String, Object> map) {
		return selectList("MyLoan.loanHistory", map);
	}

	// 총 대출 건수
	@Override
	public int historyTotal(HashMap<String, Object> map) {
		return selectOne("MyLoan.historyTotal", map);
	}

	// 대출 중 도서 내역
	@Override
	public List<BookVO> loanList(String userId) {
		return selectList("MyLoan.loanList", userId);
	}

	// 대출 중 도서 건수
	@Override
	public int loanTotal(String userId) {
		return selectOne("MyLoan.loanTotal", userId);
	}

	// 회원 연체 도서 수
	@Override
	public int overdueCount(String userId) {
		return selectOne("MyLoan.overdueCount", userId);
	}

	// 회원 대출 정지 일
	@Override
	public int myOverdueDate(String userId) {
		return selectOne("MyLoan.myOverdueDate", userId);
	}

}
