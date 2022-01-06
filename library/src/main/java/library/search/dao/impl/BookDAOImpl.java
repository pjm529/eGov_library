package library.search.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.common.domain.DateVO;
import library.search.dao.BookDAO;
import library.search.domain.BookVO;

@Repository
public class BookDAOImpl extends EgovAbstractMapper implements BookDAO {

	// 대출 중인 해당 도서 수 카운트
	@Override
	public int count(String bookIsbn) {
		return selectOne("Book.count", bookIsbn);
	}

	// 대출자 상태 체크
	@Override
	public int statusCheck(String userId) {
		return selectOne("Book.statusCheck", userId);
	}

	// 회원이 대출 중인 도서인지 체크
	@Override
	public int loanCheck(HashMap<String, Object> map) {
		return selectOne("Book.loanCheck", map);
	}

	// 도서 대출
	@Override
	public void loan(BookVO book) {
		insert("Book.loan", book);
	}

	// 대출자 대출 중 도서 수 증가
	@Override
	public void increaseCount(String userId) {
		update("Book.increaseCount", userId);
	}

	// 대출 순위
	@Override
	public List<BookVO> bookRank(DateVO date) {
		return selectList("Book.bookRank", date);
	}

}
