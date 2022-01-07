package library.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import library.board.domain.CalendarVO;
import library.board.service.CalendarService;

@Controller
@RequestMapping("/board")
public class CalendarController {

	@Autowired
	private CalendarService calendarService;

	// 일정 페이지
	@GetMapping("/calendar.do")
	public String calendar() {

		return "board/sub5/calendar.jsp";
	}

	// 일정 목록
	@ResponseBody
	@PostMapping("/calendarList.do")
	public ModelAndView calendarList() {

		ModelAndView mav = new ModelAndView("jsonView");

		List<CalendarVO> calendarList = calendarService.calendarList();

		System.out.println(calendarList);

		mav.setViewName("jsonView");
		mav.addObject(calendarList);

		return mav;
	}
}
