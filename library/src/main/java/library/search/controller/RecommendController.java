package library.search.controller;

import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
			@RequestParam String bookIsbn, @RequestParam String recNo, HttpServletResponse response) {

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

		mav.addObject("recNo", recNo);
		mav.addObject("cri", cri);
		mav.addObject("date", date);

		return mav;
	}

	// 추천 도서 팝업
	@GetMapping("/registBook.do")
	public ModelAndView registBook(@ModelAttribute Criteria cri) {

		System.out.println("/registBook 진입");

		ModelAndView mav = new ModelAndView("search/sub3/registBook.jsp");

		// BookVO 리스트 선언
		List<BookVO> bookList = new ArrayList<BookVO>();

		// 검색어와 검색타입이 Null이 아닐 때 실행
		if (cri.getKeyword() != null && cri.getType() != null && !cri.getKeyword().equals("")) {

			System.out.println("옵션 : " + cri.getType() + ", 검색 키 : " + cri.getKeyword() + ", 페이지 : " + cri.getPage());

			try {

				// api를 통해 검색어를 입력해 책 정보를 받아옴
				bookList = aladinApi.search(cri.getKeyword(), cri.getType(), cri.getPage(), cri.getAmount());

				// 검색 된 내용이 null이 아닐 때 수행
				if (!bookList.isEmpty()) {

					// 검색된 자료의 total을 가져옴
					mav.addObject("total", bookList.get(0).getTotal());

					// 페이징 처리위한 함수
					ViewPage page = new ViewPage(cri, bookList.get(0).getTotal());
					mav.addObject("page", page);

				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		mav.addObject("cri", cri);
		mav.addObject("list", bookList);

		return mav;
	}

	// 추천도서 등록
	@PostMapping("/regist.do")
	public String regist(@ModelAttribute BookVO book, Principal principal) {
		System.out.println("regist 진입");

		// 로그인 된 user_id 받아오기
		String userId = principal.getName();

		book.setUserId(userId);
		
		// 추천도서 등록
		recommendService.registBook(book);
		
		return "redirect:/search/registBook.do";
	}
}
