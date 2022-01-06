package library.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.common.domain.DateVO;
import library.common.page.Criteria;
import library.common.util.DateUtil;

@Controller
@RequestMapping("/search")
public class RecommendController {

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

		return mav;
	}


}
