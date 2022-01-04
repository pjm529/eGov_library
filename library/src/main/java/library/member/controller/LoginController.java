package library.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import library.member.domain.MemberVO;
import library.member.service.LoginService;

@Controller
@RequestMapping("/member")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private PasswordEncoder pwencoder; // 암호화 Encoder	

	// 로그인 페이지 진입
	@GetMapping("/login.do")
	public String loginGET() {

		return "member/sub1/login.jsp";

	}
	
	@PostMapping("/login.do")
	public String loginPOST(@ModelAttribute MemberVO member) {

		System.out.println("진입");
		
		String pw = loginService.login(member.getUserId());
		
		if(pwencoder.matches(member.getUserPw(), pw)) {
			System.out.println("로그인");
			return "redirect:/";
		}
		
		return "redirect:/member/login.do";
		
	}
}
