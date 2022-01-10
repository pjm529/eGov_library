package library.admin.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.board.domain.CalendarVO;
import library.board.service.CalendarService;
import library.common.domain.DateVO;
import library.common.util.DateUtil;

@Controller
@RequestMapping("/admin")
public class AdminCalendarController {

	@Autowired
	private CalendarService calendarService;

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

		// year, month 조건 검색
		List<CalendarVO> calendarList = calendarService.calendarListYM(date);

		for (CalendarVO c : calendarList) {
			c.setRegDate(c.getRegDate().substring(0, 10));
		}

		// 일정 리스트
		mav.addObject("calendarList", calendarList);

		mav.addObject("date", date);

		return mav;
	}

	// 일정 추가 팝업 (get)
	@GetMapping("/calPopUp.do")
	public String calendarPopUp() {
		return "admin/sub4/calPopUp.jsp";
	}

	// 일정 추가
	@PostMapping("/calInsert.do")
	public String calendarInsert(@ModelAttribute CalendarVO cal, Principal principal) {

		String userId = principal.getName();

		cal.setUserId(userId);

		// 종료일을 시작일과 같게
		cal.setEnd(cal.getStart());

		// 일정 추가
		calendarService.insertCalendar(cal);

		return "redirect:/admin/calPopUp.do";
	}

	// 일정 삭제
	@PostMapping("/calDelete.do")
	public String calendarDel(@ModelAttribute CalendarVO cal, @ModelAttribute DateVO date) {

		// 일정삭제
		calendarService.deleteCalendar(cal.getCalNo());

		return "redirect:/admin/calendarList.do?year=" + date.getYear() + "&month=" + date.getMonth();
	}
}
