package library.search.dao;

import java.util.HashMap;

import library.search.domain.BookVO;

public interface BookDAO {
	
	// 대출 중인 해당 도서 수 카운트
	public int count(String bookIsbn);
	
	// 대출자 상태 체크
	public int statusCheck(String userId);
	
	// 회원이 대출 중인 도서인지 체크
	public int loanCheck(HashMap<String, Object> map); 
	
	// 도서 대출
	public void loan(BookVO book);
	
	// 대출자 대출 중 도서 수 증가
	public void increaseCount(String userId);
	
}
