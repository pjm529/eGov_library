package library.mylib.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.mylib.service.MyLoanService;
import library.search.domain.BookVO;

@Controller
@RequestMapping("/mylib")
public class MyLoanController {

	@Autowired
	private MyLoanService myLoanService;

	// 대출 내역 리스트 출력 (get)
	@GetMapping("/loanHistory.do")
	public ModelAndView myLoanHistory(@ModelAttribute Criteria cri, @ModelAttribute DateVO date, Principal principal) {

		System.out.println("my_loan_history 진입");

		ModelAndView mav = new ModelAndView("mylib/sub1/loanHistory.jsp");

		// 로그인 된 user_id 받아오기
		String userId = principal.getName();

		// startDate가 null 이면 현재 날짜에서 -1년한 날짜
		if (date.getStartDate() == null) {
			date.setStartDate(date("start"));
		}

		// endDate가 null 이면 현재 날짜
		if (date.getEndDate() == null) {
			date.setEndDate(date("end"));
		}

		// 회원의 대출 내역 받아오기
		List<BookVO> loanHistory = myLoanService.loanHistoryList(userId, cri, date);

		for (BookVO book : loanHistory) {

			book.setLoanDate(book.getLoanDate().substring(0, 10));
			if (book.getReturnDate() != null) {

				book.setReturnDate(book.getReturnDate().substring(0, 10));
			}

			book.setReturnPeriod(book.getReturnPeriod().substring(0, 10));
		}

		// 대출 내역
		mav.addObject("loanHistory", loanHistory);

		// 대출 건수
		int total = myLoanService.historyTotal(userId, date);
		mav.addObject("total", total);

		// 페이징 정보
		ViewPage vp = new ViewPage(cri, total);
		mav.addObject("page", vp);

		// 날짜
		mav.addObject("date", date);

		return mav;

	}

	// 대출 중 리스트 출력 (get)
	@GetMapping("/loanList.do")
	public ModelAndView myLoanList(Principal principal) {

		System.out.println("myLoanList 진입");

		ModelAndView mav = new ModelAndView("mylib/sub1/loanList.jsp");

		// 로그인 된 user_id 받아오기
		String userId = principal.getName();

		// 회원 대출 중 리스트
		List<BookVO> loanList = myLoanService.loanList(userId);

		for (BookVO book : loanList) {

			book.setLoanDate(book.getLoanDate().substring(0, 10));

			if (book.getReturnDate() != null) {

				book.setReturnDate(book.getReturnDate().substring(0, 10));
			}

			book.setReturnPeriod(book.getReturnPeriod().substring(0, 10));
		}

		// 대출 중 내역
		mav.addObject("loanList", loanList);

		// 대출 내역 수
		int total = myLoanService.loanTotal(userId);
		mav.addObject("total", total);

		// 대출 연체 권수
		int overdueCount = myLoanService.overdueCount(userId);
		mav.addObject("overdueCount", overdueCount);

		// 회원 대출 정지일
		int overdueDate = myLoanService.myOverdueDate(userId);

		if (overdueDate != 0) {
			mav.addObject("overdueDate", dateCalc(overdueDate));
		} else {
			mav.addObject("overdueDate", "해당없음");
		}

		return mav;

	}

	// 날짜
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

	public String dateCalc(int overdue_date) {

		// 현재시간
		Calendar now = Calendar.getInstance();

		now.setTime(new Date());

		// 현재날짜에 연체일 더하기
		now.add(Calendar.DATE, overdue_date);

		// date형식을 yyyy-MM-dd로 설정
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		// 대출 정지 만기일
		String date = df.format(now.getTime());

		return date;
	}

}
