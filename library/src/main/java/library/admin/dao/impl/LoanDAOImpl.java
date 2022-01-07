package library.admin.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.admin.dao.LoanDAO;
import library.common.page.Criteria;
import library.search.domain.BookVO;

@Repository
public class LoanDAOImpl extends EgovAbstractMapper implements LoanDAO {

	// 총 대출 내역 조회
	@Override
	public List<BookVO> loanHistoryList(Criteria cri) {
		return selectList("Loan.loanHistory", cri);
	}

	// 총 대출 건 수
	@Override
	public int historyTotal(Criteria cri) {
		return selectOne("Loan.historyTotal", cri);
	}

}
