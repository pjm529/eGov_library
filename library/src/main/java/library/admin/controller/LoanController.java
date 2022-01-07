package library.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
}
