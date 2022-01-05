package library.search.dao;

public interface BookDAO {
	
	// 대출 중인 해당 도서 수 카운트
	public int count(String bookIsbn);
}
