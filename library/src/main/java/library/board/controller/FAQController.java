package library.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class FAQController {

	@GetMapping("/FAQ.do")
	public String FAQ() {
		return "board/sub2/FAQ.jsp";
	}
}
