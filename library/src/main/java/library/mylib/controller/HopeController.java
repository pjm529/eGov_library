package library.mylib.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mylib")
public class HopeController {
	
	// 희망도서 신청 페이지
	@GetMapping("/hope.do")
	public String hope() {
		return "mylib/sub2/hope.jsp";
	}

}
