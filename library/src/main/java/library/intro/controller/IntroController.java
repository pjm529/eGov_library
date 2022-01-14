package library.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/intro")
public class IntroController {

	@GetMapping("/greeting.do")
	public String intro() {
		return "intro/sub1/greeting.jsp";
	}

	@GetMapping("/history.do")
	public String history() {
		return "intro/sub2/history.jsp";
	}
}
