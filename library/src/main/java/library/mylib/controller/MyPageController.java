package library.mylib.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
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
	@PostMapping("/modifyPage.do")
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

	// 비밀번호 변경 페이지
	@GetMapping("/modifyPwPage.do")
	public String modifyPwPage() {
		return "mylib/sub5/modifyPw.jsp";
	}

	@ResponseBody
	@PostMapping("/modifyPw.do")
	public String modifyPw(String presentPw, String userPw, HttpSession session) {

		MemberVO modifyMember = new MemberVO();

		// 로그인 된 user_id 받아오기
		MemberVO loginMember = (MemberVO) session.getAttribute("MEMBER");
		String userId = loginMember.getUserId();

		// 회원 정보 받아오기
		MemberVO my = myPageService.memberInfo(userId);

		// db에 있는 회원 비밀번호
		String db_pw = my.getUserPw();

		// 입력한 현재 비밀번호과 db에 있는 비밀번호가 같으면 탈퇴 수행
		if (pwencoder.matches(presentPw, db_pw)) {

			// 비밀번호 암호화
			String encodePw = pwencoder.encode(userPw);

			// 설정
			modifyMember.setUserId(userId);
			modifyMember.setUserPw(encodePw);

			// 비밀번호 변경
			myPageService.modifyPw(modifyMember);

			// 세션 초기화
			session.invalidate();

			return "success";

		} else {

			return "fail";

		}

	}

	// 탈퇴 페이지 진입
	@GetMapping("/secessionPage.do")
	public String secessionPage() {

		System.out.println("탈퇴 페이지 진입");

		return "mylib/sub5/secession.jsp";

	}

	// 탈퇴 가능 여부 체크
	@ResponseBody
	@PostMapping("/secession")
	public String secessionPOST(String userPw, Principal principal, HttpSession session) {

		// 로그인 된 user_id 받아오기
		String userId = principal.getName();

		// 회원 정보 받아오기
		MemberVO my = myPageService.memberInfo(userId);

		// 대출 중 도서 수
		int count = my.getUserBookCount();

		// db에 있는 회원 비밀번호
		String db_pw = my.getUserPw();

		// 미반납 도서가 있을 시
		if (count > 0) {

			return "book";

		} else {

			// 입력한 비밀번호과 db에 있는 비밀번호가 같으면 탈퇴 수행
			if (pwencoder.matches(userPw, db_pw)) {

				// 회원 탈퇴
				myPageService.secessionMember(my);

				// 세션 초기화
				session.invalidate();

				return "success";

			} else {

				return "fail";

			}

		}

	}

}
