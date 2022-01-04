package library.member.controller;

import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import library.member.domain.MemberVO;
import library.member.service.SignUpService;

@Controller
@RequestMapping("/member")
public class SignUpController {

	@Autowired
	private SignUpService signUpService;

	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 bean

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
	public String memberIdChk(String userId) throws Exception {

		System.out.println("memberIdChk() 진입");

		String id = signUpService.idCheck(userId);

		System.out.println(id);

		if (id == null) {
			return "success";
		} else {

			return "fail";

		}
	}

	// 메일 중복검사
	@ResponseBody
	@PostMapping("/mailCheck.do")
	public String mailCheckPOST(String userEmail) throws Exception {

		System.out.println("mailcheckPost 진입");

		String email = signUpService.mailCheck(userEmail);

		if (email == null) {
			return sendCode(userEmail);
		} else {
			return "fail";
		}
	}

	@PostMapping("/signUpSuccess.do")
	public String signUpSuccess(@ModelAttribute MemberVO member) {

		signUpService.signUp(member);

		return "redirect:/";
	}

	// 이메일 인증코드 발송
	public String sendCode(String email) throws Exception {

		// view로부터 넘어온 데이터 확인
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("이메일 : " + email);

		// 인증번호 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(899999) + 100000; // 100000 ~ 999999 범위의 난수 생성
		System.out.println("인증번호 : " + checkNum);

		String from = "library.raon@gmail.com";
		String to = email;
		String title = "라온 도서관 : 회원가입 인증";
		String content = "라온 도서관을 이용해주셔서 감사합니다." + "<br><br>" + "인증번호는 <b>" + checkNum + "</b> 입니다." + "<br><br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		// 메일 발송
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

		String num = Integer.toString(checkNum); // view단으로 보내기 위한 난수 String 파싱

		return num;

	}

}
