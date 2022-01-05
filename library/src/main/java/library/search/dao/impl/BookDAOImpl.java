package library.search.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.search.dao.BookDAO;

@Repository
public class BookDAOImpl extends EgovAbstractMapper implements BookDAO {

	// 대출 중인 해당 도서 수 카운트
	@Override
	public int count(String bookIsbn) {
		return selectOne("Book.count", bookIsbn);
	}

}
