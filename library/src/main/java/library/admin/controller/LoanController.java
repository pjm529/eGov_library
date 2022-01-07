package library.admin.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.admin.service.LoanService;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.search.domain.BookVO;

@Controller
@RequestMapping("/admin")
public class LoanController {

	@Autowired
	private LoanService loanService;

	// 총 대출 내역
	@GetMapping("/loanHistory.do")
	public ModelAndView loanHistory(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("admin/sub2/loanHistory.jsp");

		List<BookVO> loanHistoryList = loanService.loanHistoryList(cri);

		for (BookVO book : loanHistoryList) {

			book.setLoanDate(book.getLoanDate().substring(0, 10));
			if (book.getReturnDate() != null) {

				book.setReturnDate(book.getReturnDate().substring(0, 10));
			}

			book.setReturnPeriod(book.getReturnPeriod().substring(0, 10));
		}

		mav.addObject("loanHistoryList", loanHistoryList);

		int total = loanService.historyTotal(cri);
		mav.addObject("total", total);

		ViewPage vp = new ViewPage(cri, total);
		mav.addObject("page", vp);

		return mav;
	}

	// 대출 중 리스트 출력
	@GetMapping("/loanList.do")
	public ModelAndView loanList(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("admin/sub2/loanList.jsp");

		List<BookVO> loanList = loanService.loanList(cri);

		for (BookVO book : loanList) {

			book.setLoanDate(book.getLoanDate().substring(0, 10));

			if (book.getReturnDate() != null) {

				book.setReturnDate(book.getReturnDate().substring(0, 10));
			}

			book.setReturnPeriod(book.getReturnPeriod().substring(0, 10));
		}

		mav.addObject("loanList", loanList);

		int total = loanService.loanTotal(cri);
		mav.addObject("total", total);

		ViewPage vp = new ViewPage(cri, total);
		mav.addObject("page", vp);

		return mav;

	}

	// 도서 반납
	@PostMapping("/returnBook.do")
	public String returnBook(@ModelAttribute BookVO book, @ModelAttribute Criteria cri) {

		// 도서 반납 처리
		loanService.returnBook(book.getLoanNo());

		// 연체 도서인지 확인
		int date = loanService.searchOverdue(book.getLoanNo());

		// 연체도서 일 경우
		if (date < 0) {
			date *= -1;
		} else {
			date = 0;
		}

		// 도서 반납 후 회원 정보 변동
		loanService.modifyMemberInfo(book.getUserId(), date);

		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/admin/loanList.do";
		}

		return "redirect:/admin/loanList.do?amount=" + amount + "&page=" + page + "&type=" + type + "&keyword="
				+ keyword;

	}

	// 연체 중 리스트 출력
	@GetMapping("/overdueList.do")
	public String overdueList() {

		return "admin/sub2/overdueList.jsp";

	}
}
