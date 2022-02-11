package library.admin.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.admin.service.LoanService;
import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.common.util.DateUtil;
import library.member.domain.MemberVO;
import library.search.domain.BookVO;

@Controller
@RequestMapping("/admin")
public class LoanController {

	@Autowired
	private LoanService loanService;

	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 bean

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
	public ModelAndView overdueList() {

		ModelAndView mav = new ModelAndView("admin/sub2/overdueList.jsp");

		List<BookVO> overdueList = loanService.overdueList();

		for (BookVO book : overdueList) {

			book.setLoanDate(book.getLoanDate().substring(0, 10));
			book.setReturnPeriod(book.getReturnPeriod().substring(0, 10));
		}

		mav.addObject("overdueList", overdueList);

		int total = loanService.overdueTotal();
		mav.addObject("total", total);

		return mav;
	}

	// 연체 도서 메일 전송
	@GetMapping("/overdueMail.do")
	public String overdueMail(HttpServletRequest request) throws Exception {

		String from = "library.raon@gmail.com";
		String emails[] = request.getParameterValues("userEmail");
		String title = "라온 도서관 : 연체 도서 안내";

		for (int i = 0; i < emails.length; i++) {
			String value = emails[i];
			String value_[] = value.split(",");

			String toEmail = value_[0];
			String content = "라온 도서관을 이용해주셔서 감사합니다." + "<br><br>" + "현재 연체된 도서가 있으니 반납 바랍니다." + "<br><br>"
					+ "도서 제목  : <b>" + value_[2] + "</b><br>" + "반납 예정일 : <b>" + value_[1] + "</b>";

			final MimeMessagePreparator preparator = new MimeMessagePreparator() {

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

					mailHelper.setFrom(new InternetAddress(from, "라온도서관", "UTF-8"));
					mailHelper.setTo(toEmail);
					mailHelper.setSubject(title);
					mailHelper.setText(content, true);

				}
			};

			try {
				mailSender.send(preparator);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "redirect:/admin/overdueList.do";

	}

	// 멤버 리스트 출력 (get)
	@GetMapping("/rankMember.do")
	public ModelAndView member_list(@ModelAttribute Criteria cri, @ModelAttribute DateVO date) {

		ModelAndView mav = new ModelAndView("admin/sub2/rankMember.jsp");

		// year이 null 이면 현재 날짜 기준 year
		if (date.getYear() == null) {
			date.setYear(DateUtil.date("year"));
		}

		// month가 null 이면 현재 날짜 기준 month
		if (date.getMonth() == null) {
			date.setMonth(DateUtil.date("month"));
		}

		// 날짜
		mav.addObject("date", date);

		List<MemberVO> rankList = loanService.rankList(date);

		for (MemberVO m : rankList) {
			m.setUserRegDate(m.getUserRegDate().substring(0, 10));
		}

		mav.addObject("rankList", rankList);

		return mav;

	}
}
