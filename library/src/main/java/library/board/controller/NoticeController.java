package library.board.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import library.board.domain.ReplyVO;
import library.board.service.NoticeAttachService;
import library.board.service.NoticeService;
import library.board.service.ReplyService;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.common.util.PathUtil;

@Controller
@RequestMapping("/board")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private NoticeAttachService attachService;

	@Autowired
	private ReplyService replyService;

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
	public ModelAndView noticeContent(Criteria cri, @RequestParam long noticeNo, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("board/sub1/noticeContent.jsp");

		// 조회수 증가
		noticeService.noticeViewsCount(noticeNo);

		// 공지사항 본문
		NoticeVO noticeContent = noticeService.noticeContent(noticeNo);
		mav.addObject("noticeContent", noticeContent);

		// 이전글, 다음글
		List<NoticeVO> posts = noticeService.getPrevAndNextPost(noticeNo);
		mav.addObject("posts", posts);

		// 첨부파일 목록
		List<NoticeAttachVO> attachList = attachService.noticeAttachList(noticeNo);
		mav.addObject("attachList", attachList);

		// 댓글 목록
		List<ReplyVO> replyList = replyService.replyList(noticeNo);

		for (ReplyVO r : replyList) {

			String writerName = r.getWriterName();
			String writerId = r.getWriterId();

			if (writerId != null) {

				// 관리자일 경우
				if (!r.getWriterName().equals("관리자")) {

					// 마스킹 할 부분
					String mask = writerName.substring(1, writerName.length());

					// 마스킹 갯수
					String masking = "";

					for (int i = 0; i < mask.length(); i++) {
						masking += "*";
					}

					// 마스킹 할 부분의 글자 수 만큼 *로 replace
					writerName = writerName.replace(mask, masking);
					r.setWriterName(writerName);

				}

			} else {
				r.setWriterName("(탈퇴 회원)");
			}

		}

		mav.addObject("replyList", replyList);

		// 검색 조건
		mav.addObject("cri", cri);

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

		// 첨부파일 조회
		List<NoticeAttachVO> attachList = attachService.noticeAttachList(noticeNo);
		mav.addObject("attachList", attachList);

		mav.addObject("cri", cri);

		return mav;

	}

	// 게시글 수정
	@PostMapping("/noticeModify.do")
	public String noticeModify(@ModelAttribute NoticeVO notice, @ModelAttribute Criteria cri, Principal principal) {

		// 작성자 ID
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
	public String noticeDelete(Criteria cri, @RequestParam long noticeNo, RedirectAttributes rttr,
			HttpServletRequest request) {

		// 첨부파일 리스트
		List<NoticeAttachVO> attachList = attachService.noticeAttachList(noticeNo);

		// 공지사항 삭제
		noticeService.deleteNotice(noticeNo);

		// 첨부파일 삭제
		deleteAttachFiles(attachList, request);
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

	// 폴더 내 첨부 파일 삭제
	private void deleteAttachFiles(List<NoticeAttachVO> attachList, HttpServletRequest request) {

		// 경로
		String contextPath = request.getContextPath();
		String UPLOAD_PATH = PathUtil.path(contextPath) + File.separator + "notice"; // 업로드 경로
		String filePath = UPLOAD_PATH + File.separator;

		if (attachList == null || attachList.size() == 0) {
			return;
		}

		attachList.forEach(attach -> {

			try {
				// 파일 삭제
				File attachFile = new File(filePath + attach.getUuid() + "_" + attach.getFileName());
				attachFile.delete();
			} catch (Exception e) {
				System.out.println("파일 삭제 실패 ============= " + e.getMessage());
			}

		});

	}

}
