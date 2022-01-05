package library.search.service.impl;

import java.util.HashMap;

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
	
	// 대출자 상태 체크
	@Override
	public int statusCheck(String userId) {
		return bookDAO.statusCheck(userId);
	}
	
	// 회원이 대출 중인 도서인지 체크
	@Override
	public int loanCheck(String userId, String bookIsbn) {
		
		HashMap<String, Object> map = new HashMap<>();

		map.put("userId", userId);
		map.put("bookIsbn", bookIsbn);
		
		return bookDAO.loanCheck(map);
	}

}
