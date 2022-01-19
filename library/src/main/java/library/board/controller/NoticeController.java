package library.board.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import library.board.domain.NoticeAttachVO;
import library.board.domain.NoticeVO;
import library.board.service.NoticeAttachService;
import library.board.service.NoticeService;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.common.util.PathUtil;

@Controller
@RequestMapping("/board")
public class NoticeController {
	public String UPLOAD_PATH = PathUtil.path("/library") + File.separator + "notice"; // 업로드 경로

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

		List<NoticeAttachVO> attachList = attachService.noticeAttachList(noticeNo);

		mav.addObject("noticeContent", noticeContent);
		mav.addObject("cri", cri);
		mav.addObject("posts", posts);
		mav.addObject("attachList", attachList);

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
	public String noticeDelete(Criteria cri, @RequestParam long noticeNo, RedirectAttributes rttr) {

		List<NoticeAttachVO> attachList = attachService.noticeAttachList(noticeNo);

		noticeService.deleteNotice(noticeNo);
		deleteNoticeFiles(attachList);
		rttr.addFlashAttribute("result", "success");

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

	/* 폴더 내 첨부 파일 삭제 */
	private void deleteNoticeFiles(List<NoticeAttachVO> attachList) {
		String filePath = UPLOAD_PATH + File.separator;

		if (attachList == null || attachList.size() == 0) {
			return;
		}

		attachList.forEach(attach -> {

			try {
				File file = new File(filePath + attach.getUuid() + "_" + attach.getFileName());
				file.delete();
			} catch (Exception e) {
				System.out.println("파일 삭제 실패 ============= " + e.getMessage());
			}

		});

	}

}
