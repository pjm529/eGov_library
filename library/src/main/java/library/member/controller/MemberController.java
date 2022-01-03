package library.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	// 약관동의 페이지 진입 (get)
	@GetMapping("/signupCheck.do")
	public String signupCheck() {
		return "member/sub2/signupCheck.jsp";
	}

	// 회원가입 페이지 진입
	@PostMapping("/signUp.do")
	public String signUpPage() {
		return "member/sub2/signUp.jsp";
	}

}
