package library.search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import library.common.api.AladinApi;
import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.common.util.DateUtil;
import library.search.domain.BookVO;
import library.search.service.BookService;

@Controller
@RequestMapping("/search")
public class BookController {

	@Autowired
	private BookService bookService;

	@Autowired
	private AladinApi api;

	// 도서 검색 페이지
	@GetMapping("/book.do")
	public ModelAndView book(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("search/sub1/book.jsp");

		List<BookVO> bookList = new ArrayList<BookVO>();

		// 검색어와 검색타입이 Null이 아닐 때 실행
		if (cri.getKeyword() != null && cri.getType() != null && !cri.getKeyword().equals("")) {

			System.out.println("옵션 : " + cri.getType() + ", 검색 키 : " + cri.getKeyword() + ", 페이지 : " + cri.getPage());

			try {

				// api를 통해 검색어를 입력해 책 정보를 받아옴
				bookList = api.search(cri.getKeyword(), cri.getType(), cri.getPage(), cri.getAmount());

				// 검색 된 내용이 null이 아닐 때 수행
				if (!bookList.isEmpty()) {

					// 검색된 자료의 total을 가져옴
					mav.addObject("total", bookList.get(0).getTotal());

					// 페이징 처리위한 함수
					ViewPage page = new ViewPage(cri, bookList.get(0).getTotal());
					mav.addObject("page", page);

					// 검색 된 도서의 대출 중인 책의 권수를 가져옴
					for (BookVO book : bookList) {
						book.setCount(bookService.count(book.getBookIsbn()));
					}

				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		mav.addObject("cri", cri);
		mav.addObject("list", bookList);

		return mav;
	}

	// 도서 상세페이지
	@GetMapping("/bookDetail.do")
	public ModelAndView bookDetail(@ModelAttribute Criteria cri, @RequestParam String bookIsbn,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("search/sub1/bookDetail.jsp");
		response.setContentType("text/html; charset=UTF-8");
		try {

			PrintWriter out = response.getWriter();

			// isbn이 null이 아닐 때
			if (bookIsbn != null && !bookIsbn.equals("")) {

				BookVO book = api.search_detail(bookIsbn);

				if (book.getBookTitle() != null) {

					System.out.println("선택 책 제목 : " + book.getBookTitle());
					mav.addObject("book", book);

					// 대출 중인 도서의 수를 가져옴
					int count = bookService.count(bookIsbn);
					count = 2 - count;

					mav.addObject("count", count);

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

		return mav;
	}

	// 대출자 상태 체크
	@ResponseBody
	@PostMapping("/statusChk.do")
	public String statusChk(String bookIsbn, Principal principal) throws Exception {

		// 로그인 된 user_id 받아오기
		String userId = principal.getName();

		System.out.println(userId + " 상태 체크");

		// 대출하려는 회원의 대출 상태를 체크
		int result = bookService.statusCheck(userId);

		// 대출 자격에 부합한 회원이면
		if (result == 1) {

			// 대출하려는 회원이 대출 중인 도서인지 체크
			int loan_check = bookService.loanCheck(userId, bookIsbn);

			// 중복되는 대출 중인 도서가 있다면
			if (loan_check == 1) {

				return "loan";

			} else {

				// 대출 중인 도서 상태 체크
				int count = bookService.count(bookIsbn);

				// 대출 중인 도서 수가 2권 미만일 경우
				if (count < 2) {

					return "success";

				} else {
					return "fail";
				}

			}

		} else {

			return "fail";

		}
	}

	// 책 대출
	@PostMapping("/loan")
	public String loan(@ModelAttribute Criteria cri, @ModelAttribute BookVO book, @RequestParam String detail,
			Principal principal, HttpServletResponse response) {

		// 로그인 된 user_id 받아오기
		String userId = principal.getName();

		// id 세팅
		book.setUserId(userId);

		System.out.println("\n======================== 대출 신청 ========================");
		System.out.println("대출자 아이디 : " + book.getUserId());
		System.out.println("대출 책 제목 : " + book.getBookTitle());
		System.out.println("대출 책 ISBN : " + book.getBookIsbn());
		System.out.println("keyword : " + cri.getKeyword());
		System.out.println("========================================================\n");

		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/search/book.do";
		}

		// 도서 대출 실행(대출하려는 도서의 대출 수가 2가 아닐 때)
		if (bookService.count(book.getBookIsbn()) != 2) {

			// 대출
			bookService.loan(book);

		} else {

			response.setContentType("text/html; charset=UTF-8");

			try {

				PrintWriter out = response.getWriter();
				out.println("<script>alert('오류로 인해 대출에 실패하였습니다.'); history.back();</script>");
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		if (detail.equals("true")) {

			return "redirect:/search/bestBookDetail.do?bookIsbn=" + book.getBookIsbn();

		} else {
			return "redirect:/search/bookDetail.do?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&type="
					+ cri.getType() + "&keyword=" + keyword + "&bookIsbn=" + book.getBookIsbn();
		}

	}

	// 대출베스트 출력
	@GetMapping("/bestBook.do")
	public ModelAndView bestBook(@ModelAttribute Criteria cri, @ModelAttribute DateVO date) {

		System.out.println("bestBook 진입");
		
		ModelAndView mav = new ModelAndView("search/sub2/bestBook.jsp");

		// year이 null 이면 현재 날짜 기준 year
		if (date.getYear() == null) {
			date.setYear(DateUtil.date("year"));
		}

		// month가 null 이면 현재 날짜 기준 month
		if (date.getMonth() == null) {
			date.setMonth(DateUtil.date("month"));
		}

		// 년
		mav.addObject("date", date);
		
		return mav;
	}

}
