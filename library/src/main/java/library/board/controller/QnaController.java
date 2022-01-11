package library.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library.board.domain.EnquiryVO;
import library.board.service.QnaService;
import library.common.page.Criteria;
import library.common.page.ViewPage;

@Controller
@RequestMapping("/board")
public class QnaController {

	@Autowired
	private QnaService qnaService;

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
	public ModelAndView enquiryContent(@RequestParam long enquiryNo, @ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("board/sub3/enquiryContent.jsp");

		// 문의사항 게시글 내용
		EnquiryVO enquiry = qnaService.enquiryContent(enquiryNo);
		mav.addObject("enquiry", enquiry);

		// 조회수 증가
		qnaService.updateView(enquiryNo);

		mav.addObject("cri", cri);

		return mav;

	}
}
