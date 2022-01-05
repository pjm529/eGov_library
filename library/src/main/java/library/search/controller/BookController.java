package library.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class BookController {

	// 도서 검색 페이지
	@GetMapping("/book.do")
	public String book() {
		
		return "search/sub1/book.jsp";
	}
}
