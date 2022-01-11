package library.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library.board.domain.AnswerVO;
import library.board.domain.EnquiryVO;
import library.board.service.AnswerService;
import library.board.service.QnaService;
import library.common.page.Criteria;
import library.common.page.ViewPage;

@Controller
@RequestMapping("/board")
public class QnaController {

	@Autowired
	private QnaService qnaService;

	@Autowired
	private AnswerService answerService;

	@GetMapping("/qnaBoardList.do")
	public ModelAndView qnaBoardList(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("board/sub3/qnaBoardList.jsp");

		// 문의 사항 리스트
		List<EnquiryVO> qnaBoardList = qnaService.qnaBoardList(cri);
		mav.addObject("qnaBoardList", qnaBoardList);

		// 문의 사항 게시글 수
		int total = qnaService.qnaTotal(cri);
		mav.addObject("total", total);

		// 페이징
		ViewPage vp = new ViewPage(cri, total);
		mav.addObject("page", vp);

		return mav;
	}

	// 게시물 본문
	@GetMapping("/enquiryContent.do")
	public ModelAndView enquiryContent(@RequestParam long enquiryNo, @ModelAttribute Criteria cri, Principal principal,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("board/sub3/enquiryContent.jsp");

		response.setContentType("text/html; charset=UTF-8");

		// 문의사항 게시글 내용
		EnquiryVO enquiry = qnaService.enquiryContent(enquiryNo);

		// 문의사항 작성자 ID
		String writerId = enquiry.getWriterId();

		// 로그인 된 아이디
		String loginId = principal.getName();

		// 관리자 계정 확인
		int check = qnaService.checkAdmin(loginId);

		// 로그인 한 아이디와 문의사항 작성자 ID가 일치하지 않을 경우
		if (!writerId.equals(loginId) && check != 1) {

			try {

				PrintWriter out = response.getWriter();
				out.println("<script>alert('게시글의 작성자만 확인할 수 있습니다.'); history.back();</script>");
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		mav.addObject("enquiry", enquiry);

		// 조회수 증가
		qnaService.updateView(enquiryNo);

		mav.addObject("cri", cri);

		return mav;

	}

	// ========================================= 답글
	// 답글 게시물 본문
	@GetMapping("/answerContent.do")
	public ModelAndView answerContent(@RequestParam long answerNo, @ModelAttribute Criteria cri, Principal principal,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("board/sub3/answerContent.jsp");

		response.setContentType("text/html; charset=UTF-8");

		// 답변 내용
		AnswerVO answer = answerService.answerContent(answerNo);

		// 문의사항 작성자 ID
		String writerId = answer.getWriterId();

		// 로그인 된 아이디
		String loginId = principal.getName();

		// 관리자 계정 확인
		int check = qnaService.checkAdmin(loginId);

		// 로그인 한 아이디와 문의사항 작성자 ID가 일치하지 않을 경우
		if (!writerId.equals(loginId) && check != 1) {

			try {

				PrintWriter out = response.getWriter();
				out.println("<script>alert('게시글의 작성자만 확인할 수 있습니다.'); history.back();</script>");
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		mav.addObject("answer", answer);

		// 조회수 증가
		answerService.updateView(answerNo);
		mav.addObject("cri", cri);

		return mav;

	}
}
