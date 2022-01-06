package library.mylib.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.search.domain.BookVO;

@Controller
@RequestMapping("/mylib")
public class MyLoanHistoryController {

	// 대출 내역 리스트 출력 (get)
	@GetMapping("/loanHistory.do")
	public ModelAndView my_loan_history() {

		System.out.println("my_loan_history 진입");
		
		ModelAndView mav = new ModelAndView("mylib/sub1/loanHistory.jsp");


		return mav;

	}

	public String date(String type) {
		Date now = new Date();
		Calendar cal = Calendar.getInstance();

		cal.setTime(now);

		int year = cal.get(Calendar.YEAR) - 1;
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);

		String strMonth = Integer.toString(month);
		String strDay = Integer.toString(day);

		if (strMonth.length() == 1) {
			strMonth = "0" + strMonth;
		}

		if (strDay.length() == 1) {
			strDay = "0" + strDay;
		}

		// 현재 날짜 -1년
		String start_date = year + "-" + strMonth + "-" + strDay;

		// 현재 날짜
		String end_date = year + 1 + "-" + strMonth + "-" + strDay;

		if (type.equals("start")) {
			return start_date;
		} else {
			return end_date;
		}
	}

}
