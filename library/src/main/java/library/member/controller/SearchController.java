package library.member.controller;

import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import library.member.domain.MemberVO;
import library.member.service.SearchService;

@Controller
@RequestMapping("/member")
public class SearchController {

	@Autowired
	private SearchService searchService;

	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 bean

	@Autowired
	private PasswordEncoder pwencoder; // 암호화 Encoder

	// 아이디 찾기 페이지 진입
	@GetMapping("/searchId.do")
	public String searchIdPage() {

		System.out.println("아이디 찾기 페이지 진입");

		return "member/sub3/searchId.jsp";

	}

	// 아이디 찾기 정보확인
	@ResponseBody
	@PostMapping("/searchIdCheck.do")
	public String searchIdCheck(@ModelAttribute MemberVO member) throws Exception {

		System.out.println("searchIdCheck() 진입");

		String id = searchService.searchId(member);

		if (id == null) {

			return "fail";

		} else {

			return "success";

		}
	}

	// 아이디 찾기 성공
	@PostMapping("/searchId.do")
	public String searchIdPOST(@ModelAttribute MemberVO member, Model model) throws Exception {

		System.out.println("searchId() 진입");

		String result = searchService.searchId(member);

		model.addAttribute("searchId", result);

		System.out.println(result);
		return "redirect:/member/searchIdResult.do";

	}

	// 아이디 찾기 결과
	@GetMapping("/searchIdResult.do")
	public String searchIdResult(@RequestParam String searchId, Model model) {

		model.addAttribute("searchId", searchId);

		return "member/sub3/searchIdResult.jsp";

	}

	// 비밀번호 찾기 페이지 진입
	@GetMapping("/searchPw.do")
	public String searchPwGET() {

		System.out.println("비밀번호 찾기 페이지 진입");

		return "member/sub4/searchPw.jsp";

	}

	// 비밀번호 찾기 정보확인
	@ResponseBody
	@PostMapping("/searchPwCheck.do")
	public String searchPwCheck(@ModelAttribute MemberVO member) throws Exception {

		System.out.println("searchPwdCheck() 진입");

		int result = searchService.searchPw(member);

		if (result == 0) {

			return "fail";

		} else {

			return "success";

		}
	}

	// 비밀번호 찾기 성공 후 초기화
	@PostMapping("/searchPw.do")
	public String searchPwPost(@ModelAttribute MemberVO member) throws Exception {

		// 인증번호 난수 생성
		Random random = new Random();
		int rndNum = random.nextInt(89999999) + 10000000; // 10000000 ~ 99999999 범위의 난수 생성
		String newPw = Integer.toString(rndNum);

		String from = "library.raon@gmail.com";
		String to = member.getUserEmail();
		String title = "라온 도서관 : 비밀번호 초기화";
		String content = "라온 도서관을 이용해주셔서 감사합니다." + "<br><br>" + "초기화 된 비밀번호는 <b>" + newPw + "</b> 입니다." + "<br><br>"
				+ "로그인 후 비밀번호를 변경하여주세요.";

		final MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				mailHelper.setFrom(new InternetAddress(from, "라온도서관", "UTF-8"));
				mailHelper.setTo(to);
				mailHelper.setSubject(title);
				mailHelper.setText(content, true);

			}
		};

		try {
			mailSender.send(preparator);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String encodePw = pwencoder.encode(newPw);

		member.setUserPw(encodePw);
		
		// 비밀번호 초기화 실행
		searchService.resetPw(member);

		return "redirect:/member/login.do";

	}

}
