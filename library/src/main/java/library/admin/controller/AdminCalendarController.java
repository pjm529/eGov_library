package library.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.common.domain.DateVO;
import library.common.util.DateUtil;

@Controller
@RequestMapping("/admin")
public class AdminCalendarController {

	// 일정 리스트 출력 (get)
	@GetMapping("/calendarList.do")
	public ModelAndView calendar_list(@ModelAttribute DateVO date) {

		ModelAndView mav = new ModelAndView("admin/sub4/calendarList.jsp");

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
