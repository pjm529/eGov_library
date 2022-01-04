package library.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public String loginPOST(HttpServletRequest request, HttpServletResponse response, @ModelAttribute MemberVO member) {

		System.out.println("진입");

		MemberVO memberInfo = loginService.login(member.getUserId());

		response.setContentType("text/html; charset=UTF-8");
		String msg = "<script>alert('ID 및 PW 오류입니다.'); history.back();</script>";

		if (memberInfo == null) {

			try {

				PrintWriter out = response.getWriter();
				out.println(msg);
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			}

			return null;

		} else {

			if (!pwencoder.matches(member.getUserPw(), memberInfo.getUserPw())) {
				try {
					PrintWriter out = response.getWriter();
					out.println(msg);
					out.flush();

				} catch (IOException e) {
					e.printStackTrace();
				}

				return null;

			} else {

				HttpSession httpSession = request.getSession(true);
				httpSession.setAttribute("MEMBER", memberInfo);

				System.out.println("로그인");
				return "redirect:/";

			}
		}
	}

	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("MEMBER");

		return "redirect:/";

	}
}
