package library.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	// 회원가입 안내
	@GetMapping("/signUp.do")
	public String signup() {

		return "info/sub1/signUp.jsp";
	}
	
}
