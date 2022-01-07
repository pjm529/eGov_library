package library.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class CalendarController {

	@GetMapping("/calendar.do")
	public String calendar() {

		return "board/sub5/calendar.jsp";
	}

}
