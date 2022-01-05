package library.admin.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library.admin.service.AdminService;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.member.domain.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 bean

	// 회원 목록 페이지
	@GetMapping("/memberList.do")
	public ModelAndView memberList(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("admin/sub1/memberList.jsp");

		// 멤버 목록 조회
		List<MemberVO> memberList = adminService.memberList(cri);

		// 가입 시간 제거
		for (MemberVO m : memberList) {
			m.setUserRegDate(m.getUserRegDate().substring(0, 10));
		}

		mav.addObject("memberList", memberList);

		// 총 회원 수
		int total = adminService.memberTotal(cri);
		mav.addObject("total", total);

		// 페이징 정보
		ViewPage page = new ViewPage(cri, total);
		mav.addObject("page", page);

		return mav;
	}

	// 회원 정보 페이지
	@GetMapping("/memberInfo.do")
	public ModelAndView memberInfo(@ModelAttribute Criteria cri, @RequestParam String userId) {

		ModelAndView mav = new ModelAndView("admin/sub1/memberInfo.jsp");

		// 회원 정보 조회
		MemberVO member = adminService.memberInfo(userId);
		member.setUserRegDate(member.getUserRegDate().substring(0, 10));
		mav.addObject("member", member);

		mav.addObject("cri", cri);

		return mav;
	}

	// 회원 수정 페이지
	@GetMapping("/memberModifyPage.do")
	public ModelAndView memberModifyPage(@ModelAttribute Criteria cri, @RequestParam String userId) {
		ModelAndView mav = new ModelAndView("admin/sub1/memberModify.jsp");

		// 회원 정보 조회
		MemberVO member = adminService.memberInfo(userId);
		member.setUserRegDate(member.getUserRegDate().substring(0, 10));
		mav.addObject("member", member);

		mav.addObject("cri", cri);

		return mav;
	}

	// 회원 정보 수정
	@PostMapping("/memberModify.do")
	public String memberModify(@ModelAttribute Criteria cri, @ModelAttribute MemberVO member) {

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		String userId = member.getUserId();

		adminService.memberModify(member);

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "redirect:/admin/memberList.do";
		}

		return "redirect:/admin/memberInfo.do?amount=" + amount + "&page=" + page + "&type=" + type + "&keyword="
				+ keyword + "&userId=" + userId;

	}

	// 회원 탈퇴
	@PostMapping("/memberDelete.do")
	public String memberDelete(@ModelAttribute Criteria cri, @ModelAttribute MemberVO member) {

		// 회원 탈퇴
		adminService.memberDelete(member);

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "redirect:/admin/memberList.do";
		}

		return "redirect:/admin/memberList.do?amount=" + amount + "&page=" + page + "&type=" + type + "&keyword="
				+ keyword;

	}

	// 메일 작성 페이지
	@GetMapping("/mail.do")
	public ModelAndView mail(@ModelAttribute Criteria cri, @RequestParam String userId) {

		ModelAndView mav = new ModelAndView("admin/sub1/mail.jsp");
		
		// 회원 정보 조회
		MemberVO member = adminService.memberInfo(userId);
		mav.addObject("member", member);
		mav.addObject("cri", cri);
		
		return mav;

	}

	// 메일 전송
	@PostMapping("/mailSend.do")
	public String mailSend(@ModelAttribute Criteria cri, @ModelAttribute MemberVO member,
			@RequestParam String mailTitle, @RequestParam String mailContent) {

		sendMail(member.getUserEmail(), mailTitle, mailContent);
		
		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		String userId = member.getUserId();


		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "redirect:/admin/memberList.do";
		}

		return "redirect:/admin/memberInfo.do?amount=" + amount + "&page=" + page + "&type=" + type + "&keyword="
				+ keyword + "&userId=" + userId;

	}

	// 메일 전송 함수
	public void sendMail(String email, String mailTitle, String mailContent) {

		String from = "library.raon@gmail.com";
		String to = email;
		String title = mailTitle;
		String content = mailContent;

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

	}

}
