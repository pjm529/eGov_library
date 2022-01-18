package library.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library.board.domain.NoticeVO;
import library.board.service.NoticeService;
import library.common.page.Criteria;
import library.common.page.ViewPage;

@Controller
@RequestMapping("/board")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	// 공지사항 목록
	@GetMapping("/noticeList.do")
	public ModelAndView noticeList(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("board/sub1/noticeList.jsp");

		// 공지사항 목록
		List<NoticeVO> noticeList = noticeService.noticeList(cri);
		mav.addObject("noticeList", noticeList);

		// 공지사항 게시글 수
		int total = noticeService.noticeTotal(cri);
		mav.addObject("total", total);

		ViewPage vp = new ViewPage(cri, total);
		mav.addObject("page", vp);

		return mav;
	}

	// 공지사항 본문
	@GetMapping("/noticeContent.do")
	public ModelAndView noticeContent(Criteria cri,  @RequestParam long noticeNo) {

		ModelAndView mav = new ModelAndView("board/sub1/noticeContent.jsp");
		
		// 조회수 증가
		noticeService.noticeViewsCount(noticeNo);

		NoticeVO noticeContent = noticeService.noticeContent(noticeNo);
		List<NoticeVO> posts = noticeService.getPrevAndNextPost(noticeNo);

		mav.addObject("noticeContent", noticeContent);
		mav.addObject("cri", cri);
		mav.addObject("posts", posts);

		return mav;
	}

}
