package library.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class LoginController {

	// 로그인 페이지 진입
	@GetMapping("/login.do")
	public String loginGET() {

		return "member/sub1/login.jsp";

	}

	@GetMapping("/logout.do")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/";

	}
}
