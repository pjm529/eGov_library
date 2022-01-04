package library.mylib.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import library.member.domain.MemberVO;
import library.mylib.service.MyPageService;

@Controller
@RequestMapping("/mylib")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private PasswordEncoder pwencoder; // 암호화 Encoder

	// 마이 페이지 진입 전 비밀번호 확인
	@GetMapping("/myPage.do")
	public String check() {
		return "mylib/sub5/check.jsp";
	}

	// 비밀번호 체크
	@ResponseBody
	@PostMapping("/checkPw.do")
	public String checkPw(String userPw, HttpSession session) {

		MemberVO loginMember = (MemberVO) session.getAttribute("MEMBER");

		// 로그인 된 user_id 받아오기
		String userId = loginMember.getUserId();

		MemberVO memberInfo = myPageService.memberInfo(userId);

		// 입력한 비밀번호과 db에 있는 비밀번호가 같으면 탈퇴 수행
		if (pwencoder.matches(userPw, memberInfo.getUserPw())) {

			return "success";

		} else {

			return "fail";

		}
	}

	// 마이 페이지 진입
	@PostMapping("/myPage.do")
	public ModelAndView mypage(HttpSession session) {

		System.out.println("마이 페이지 진입");
		ModelAndView mav = new ModelAndView("mylib/sub5/myPage.jsp");

		// 로그인 된 user_id 받아오기
		MemberVO loginMember = (MemberVO) session.getAttribute("MEMBER");
		String userId = loginMember.getUserId();

		MemberVO my = myPageService.memberInfo(userId);

		my.setUserRegDate(my.getUserRegDate().substring(0, 10));
		mav.addObject("my", my);

		return mav;

	}

	// 수정 페이지 진입
	@GetMapping("/modify.do")
	public ModelAndView modifyPage(HttpSession session) {
		System.out.println("수정 페이지 진입");

		ModelAndView mav = new ModelAndView("mylib/sub5/modify.jsp");

		// 로그인 된 user_id 받아오기
		MemberVO loginMember = (MemberVO) session.getAttribute("MEMBER");
		String userId = loginMember.getUserId();

		MemberVO my = myPageService.memberInfo(userId);

		my.setUserRegDate(my.getUserRegDate().substring(0, 10));
		mav.addObject("my", my);

		return mav;

	}

	// 정보 수정
	@PostMapping("/modify.do")
	public String modifyPOST(HttpSession session, @ModelAttribute MemberVO member) {

		System.out.println("수정post 진입");

		// 로그인 된 user_id 받아오기
		MemberVO loginMember = (MemberVO) session.getAttribute("MEMBER");
		String userId = loginMember.getUserId();

		member.setUserId(userId);

		myPageService.modifyMember(member);

		return "redirect:/mylib/myPage.do";
	}

}
