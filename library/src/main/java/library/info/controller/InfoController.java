package library.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	// 회원가입 안내
	@GetMapping("/signUp.do")
	public String signUp() {
		return "info/sub1/signUp.jsp";
	}
	
	// 이용시간 및 휴관일 페이지
	@GetMapping("/openingHours.do")
	public String openingHours() {
		return "info/sub2/openingHours.jsp";
	}
	
	
}
