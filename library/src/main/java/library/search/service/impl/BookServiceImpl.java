package library.search.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.search.dao.BookDAO;
import library.search.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO bookDAO;
	// 대출 중인 해당 도서 수 카운트
	@Override
	public int count(String bookIsbn) {
		return bookDAO.count(bookIsbn);
	}

}
