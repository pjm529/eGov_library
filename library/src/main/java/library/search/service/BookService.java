package library.search.service;

import java.util.List;

import library.common.domain.DateVO;
import library.search.domain.BookVO;

public interface BookService {

	// 대출 중인 해당 도서 수 카운트
	public int count(String bookIsbn);

	// 대출자 상태 체크
	public int statusCheck(String userId);

	// 회원이 대출 중인 도서인지 체크
	public int loanCheck(String userId, String bookIsbn);
	
	// 도서 대출
	public void loan(BookVO book);

	// 대출 순위
	public List<BookVO> bookRank(DateVO date);

}
