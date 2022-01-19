package library.board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import library.board.domain.NoticeAttachVO;
import library.board.domain.NoticeVO;
import library.board.service.NoticeAttachService;
import library.board.service.NoticeService;
import library.common.page.Criteria;
import library.common.page.ViewPage;

@Controller
@RequestMapping("/board")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private NoticeAttachService attachService;

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
	public ModelAndView noticeContent(Criteria cri, @RequestParam long noticeNo) {

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

	// 공지사항 등록 페이지
	@GetMapping("/noticeInsertPage.do")
	public String noticeInsertPage() {
		return "board/sub1/noticeInsert.jsp";
	}

	// 게시글 등록
	@PostMapping("/noticeInsert.do")
	public String noticeInsert(@ModelAttribute NoticeVO notice, Principal principal) {

		// 로그인 된 user_id 받아오기
		String userId = principal.getName();

		// 첨부 파일이 있는 경우
		if (notice.getNoticeAttachList() != null) {
			notice.getNoticeAttachList().forEach(attach -> System.out.println(attach));
		}

		notice.setWriterId(userId);

		noticeService.insertNotice(notice);

		return "redirect:/board/noticeList.do";
	}

	// 게시글 수정 페이지
	@GetMapping("/noticeModifyPage.do")
	public ModelAndView noticeModifyPage(@ModelAttribute Criteria cri, @RequestParam long noticeNo) {

		ModelAndView mav = new ModelAndView("board/sub1/noticeModify.jsp");

		// 게시글 조회
		NoticeVO notice = noticeService.noticeContent(noticeNo);
		mav.addObject("noticeContent", notice);

		mav.addObject("cri", cri);

		return mav;

	}

	// 게시글 수정
	@PostMapping("/noticeModify.do")
	public String noticeModify(@ModelAttribute NoticeVO notice, @ModelAttribute Criteria cri, Principal principal) {

		String userId = principal.getName();
		notice.setWriterId(userId);

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		long noticeNo = notice.getNoticeNo();

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/noticeList.do";
		}

		noticeService.noticeModify(notice);

		return "redirect:/board/noticeContent.do?page=" + page + "&amount=" + amount + "&type=" + type + "&keyword="
				+ keyword + "&noticeNo=" + noticeNo;
	}

	// 게시글 삭제
	@PostMapping("/noticeDelete.do")
	public String noticeDelete(Criteria cri, @RequestParam long noticeNo) {

		noticeService.deleteNotice(noticeNo);

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/noticeList.do";
		}

		return "redirect:/board/noticeList.do?page=" + page + "&amount=" + amount + "&type=" + type + "&keyword="
				+ keyword;
	}

	// 첨부파일 조회
	@GetMapping(value = "/getNoticeAttachList.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ModelAndView getNoticeAttachList(Long noticeNo) {

		ModelAndView mav = new ModelAndView("jsonView");
		
		List<NoticeAttachVO> noticeAttachList = attachService.noticeAttachList(noticeNo);
		
		mav.setViewName("jsonView");
		mav.addObject(noticeAttachList);
		
		return mav;
	}
}
