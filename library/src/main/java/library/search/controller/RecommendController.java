package library.search.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library.common.api.AladinApi;
import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.common.util.DateUtil;
import library.search.domain.BookVO;
import library.search.service.BookService;
import library.search.service.RecommendService;

@Controller
@RequestMapping("/search")
public class RecommendController {

	@Autowired
	private AladinApi aladinApi;

	@Autowired
	private BookService bookService;

	@Autowired
	private RecommendService recommendService;

	// 추천 도서 출력
	@GetMapping("/recommendBook.do")
	public ModelAndView recommendBook(@ModelAttribute Criteria cri, @ModelAttribute DateVO date) {

		System.out.println("recommendBook 진입");

		ModelAndView mav = new ModelAndView("search/sub3/recommendBook.jsp");

		// year이 null 이면 현재 날짜 기준 year
		if (date.getYear() == null) {
			date.setYear(DateUtil.date("year"));
		}

		// month가 null 이면 현재 날짜 기준 month
		if (date.getMonth() == null) {
			date.setMonth(DateUtil.date("month"));
		}

		mav.addObject("date", date);

		// BookDTO 리스트 출력
		List<BookVO> list = recommendService.recommedList(cri, date);

		mav.addObject("list", list);

		// 추천 도서 권수
		int total = recommendService.getTotal(date);

		// 페이징
		ViewPage vp = new ViewPage(cri, total);

		mav.addObject("page", vp);

		return mav;
	}

	// 도서 상세페이지
	@GetMapping("/recommendBookDetail.do")
	public ModelAndView recommned_book_detail(@ModelAttribute Criteria cri, @ModelAttribute DateVO date,
			@RequestParam String bookIsbn, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("search/sub3/recommendBookDetail.jsp");

		response.setContentType("text/html; charset=UTF-8");

		try {

			PrintWriter out = response.getWriter();

			// isbn이 null이 아닐 때
			if (bookIsbn != null && !bookIsbn.equals("")) {

				BookVO book = aladinApi.search_detail(bookIsbn);

				if (book.getBookTitle() != null) {

					System.out.println("선택 책 제목 : " + book.getBookTitle());

					// 대출 중인 도서의 수를 가져옴
					book.setCount(bookService.count(bookIsbn));

					mav.addObject("book", book);

				} else {
					out.println("<script>alert('잘못된 접근입니다.'); history.back();</script>");
					out.flush();
				}

			} else {
				out.println("<script>alert('잘못된 접근입니다.'); history.back();</script>");
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		mav.addObject("cri", cri);
		mav.addObject("date", date);

		return mav;
	}
}
