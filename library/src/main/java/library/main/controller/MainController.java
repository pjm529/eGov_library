package library.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import library.admin.domain.BannerVO;
import library.admin.service.BannerService;
import library.board.domain.CalendarVO;
import library.board.domain.NoticeVO;
import library.board.service.CalendarService;
import library.board.service.NoticeService;
import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.common.util.DateUtil;
import library.mylib.service.ReserveService;
import library.search.domain.BookVO;
import library.search.service.BookService;
import library.search.service.RecommendService;

@Controller
public class MainController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private ReserveService reserveService;

	@Autowired
	private CalendarService calService;

	@Autowired
	private RecommendService recommendService;

	@Autowired
	private BookService bookService;

	@Autowired
	private BannerService bannerService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView mainPage(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("index.jsp");

		// 현재 날짜
		DateVO date = new DateVO();
		date.setYear(DateUtil.date("year"));
		date.setMonth(DateUtil.date("month"));
		mav.addObject("date", date);

		// 공지사항
		List<NoticeVO> noticeList = noticeService.noticeList(cri);
		mav.addObject("noticeList", noticeList);

		// 제 1열람실 현황
		int rd1UsingSeat = reserveService.usingSeat("room1");
		mav.addObject("rd1UsingSeat", rd1UsingSeat);

		// 제 2열람실 현황
		int rd2UsingSeat = reserveService.usingSeat("room2");
		mav.addObject("rd2UsingSeat", rd2UsingSeat);

		// 노트북실 현황
		int nbUsingSeat = reserveService.usingSeat("nb");
		mav.addObject("nbUsingSeat", nbUsingSeat);

		// 휴관일 검색
		List<CalendarVO> calList = calService.searchClosed(date);

		for (CalendarVO c : calList) {

			c.setStart(c.getStart().substring(8, 10));
		}
		mav.addObject("calList", calList);

		// 추천도서
		List<BookVO> recList = recommendService.recommedList(cri, date);
		mav.addObject("recList", recList);

		// 대출 베스트
		List<BookVO> bestList = bookService.bookRank(date);
		mav.addObject("bestList", bestList);

		// 배너 목록
		List<BannerVO> bannerList = bannerService.bannerList();
		mav.addObject("bannerList", bannerList);

		return mav;
	}

	@GetMapping("/accessError.do")
	public String accessError() {
		return "error/accessError.jsp";
	}

	@GetMapping("/accessError3.do")
	public String accessError3() {
		return "error/accessError3.jsp";
	}
}
