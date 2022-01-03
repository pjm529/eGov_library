package library.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import library.member.service.SignUpService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private SignUpService signUpService;

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

	// 아이디 중복검사
	@ResponseBody
	@PostMapping("/memberIdChk.do")
	public String memberIdChk(String memberId) throws Exception {

		System.out.println("memberIdChk() 진입");

		int result = signUpService.idCheck(memberId);

		// 탈퇴 회원 중 아이디 체크
		//int result2 = signUpService.secession_idCheck(memberId);

		if (result != 0) {

			return "fail";

		} else {

			return "success";

		}
	}

}
