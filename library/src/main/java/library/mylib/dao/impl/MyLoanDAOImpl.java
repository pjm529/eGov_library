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

}
