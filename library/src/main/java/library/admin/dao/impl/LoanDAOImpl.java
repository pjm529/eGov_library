package library.admin.dao.impl;

import java.util.HashMap;
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

	// 대출 중 리스트
	@Override
	public List<BookVO> loanList(Criteria cri) {
		return selectList("Loan.loanList", cri);
	}

	// 대출 중 도서 건수
	@Override
	public int loanTotal(Criteria cri) {
		return selectOne("Loan.loanTotal", cri);
	}

	// 도서 반납
	@Override
	public void returnBook(int loanNo) {
		update("Loan.returnBook", loanNo);
	}

	// 연체 일 확인
	@Override
	public int searchOverdue(int loanNo) {
		return selectOne("Loan.searchOverdue", loanNo);
	}

	// 반납 후 회원 정보 수정
	@Override
	public void modifyMemberInfo(HashMap<String, Object> map) {
		update("Loan.modifyMemberInfo", map);
	}

}
