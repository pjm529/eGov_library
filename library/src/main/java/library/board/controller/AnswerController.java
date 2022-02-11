package library.board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library.board.domain.AnswerVO;
import library.board.domain.EnquiryVO;
import library.board.service.AnswerService;
import library.board.service.QnaService;
import library.common.page.Criteria;

@Controller
@RequestMapping("/board")
public class AnswerController {

	@Autowired
	private QnaService qnaService;

	@Autowired
	private AnswerService answerService;

	// 답글 게시물 본문
	@GetMapping("/answerContent.do")
	public ModelAndView answerContent(@RequestParam long answerNo, @ModelAttribute Criteria cri, Principal principal,
			HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("board/sub3/answerContent.jsp");

		// 답변 내용
		AnswerVO answer = answerService.answerContent(answerNo);

		// 문의사항 작성자 ID
		String writerId = answer.getWriterId();

		// 로그인 된 아이디
		String loginId = principal.getName();

		// 로그인 한 아이디와 문의사항 작성자 ID가 일치하지 않을 경우 && 관리자가 아닐경우
		if (!writerId.equals(loginId) && !request.isUserInRole("ROLE_ADMIN")) {
			mav = new ModelAndView("error/accessError2.jsp");
			return mav;
		}

		mav.addObject("answer", answer);

		// 조회수 증가
		answerService.updateView(answerNo);
		mav.addObject("cri", cri);

		return mav;
	}

	// 답글 등록 페이지
	@GetMapping("/answerWritePage.do")
	public ModelAndView answerWritePage(@RequestParam long enquiryNo, @ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("board/sub3/answerWrite.jsp");

		EnquiryVO enquiry = qnaService.enquiryContent(enquiryNo);

		mav.addObject("enquiry", enquiry);
		mav.addObject("cri", cri);

		return mav;
	}

	// 답글 등록
	@PostMapping("/answerWrite.do")
	public String answerWrite(@ModelAttribute AnswerVO answer, @ModelAttribute Criteria cri, Principal principal,
			HttpServletRequest request) {

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();

		// 작성자 ID 설정
		answer.setAWriterId(principal.getName());

		// 관리자가 아닐경우
		if (!request.isUserInRole("ROLE_ADMIN")) {
			return "redirect:/accessError.do";
		}
		answerService.insertAnswer(answer);

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/qnaBoardList.do";
		}

		return "redirect:/board/qnaBoardList.do?amount=" + amount + "&page=" + page + "&keyword=" + keyword + "&type="
				+ type;
	}

	// 답글 수정 페이지
	@GetMapping("/answerModifyPage.do")
	public ModelAndView answerModifyPage(@RequestParam long answerNo, @ModelAttribute Criteria cri,
			HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("board/sub3/answerModify.jsp");

		// 답변 내용
		AnswerVO answer = answerService.answerContent(answerNo);

		// 관리자가 아닐경우
		if (!request.isUserInRole("ROLE_ADMIN")) {
			mav = new ModelAndView("error/accessError.jsp");
			return mav;
		}

		mav.addObject("answer", answer);

		mav.addObject("cri", cri);

		return mav;
	}

	// 답글 수정
	@PostMapping("/answerModify.do")
	public String answerModify(@ModelAttribute AnswerVO answer, @ModelAttribute Criteria cri, Principal principal,
			HttpServletRequest request) {

		// 로그인 된 user_id 받아오기
		String loginId = principal.getName();

		answer.setAWriterId(loginId);

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();

		// 관리자가 아닐경우
		if (!request.isUserInRole("ROLE_ADMIN")) {
			return "redirect:/accessError.do";
		}

		// 답글 수정
		answerService.modifyAnswer(answer);

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/qnaBoardList.do";
		}

		return "redirect:/board/answerContent.do?amount=" + amount + "&page=" + page + "&keyword=" + keyword + "&type="
				+ type + "&answerNo=" + answer.getAnswerNo();
	}

	// 답글 삭제
	@GetMapping("/answerDelete.do")
	public String answerDelete(@ModelAttribute Criteria cri, @RequestParam long answerNo, HttpServletRequest request) {

		// 관리자가 아닐경우
		if (!request.isUserInRole("ROLE_ADMIN")) {
			return "redirect:/accessError.do";
		}

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();

		answerService.deleteAnswer(answerNo);
		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");

		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/qnaBoardList.do";
		}

		return "redirect:/board/qnaBoardList.do?amount=" + amount + "&page=" + page + "&keyword=" + keyword + "&type="
				+ type;

	}

}
