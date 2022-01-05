package library.search.service;

public interface BookService {

	// 대출 중인 해당 도서 수 카운트
	public int count(String bookIsbn);
}
