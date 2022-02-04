package library.board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import library.board.domain.ReplyVO;
import library.board.service.QnaService;
import library.board.service.ReplyService;
import library.common.page.Criteria;

@Controller
@RequestMapping("/board")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	@Autowired
	private QnaService qnaService;

	// 댓글 입력
	@PostMapping("/replyInsert.do")
	public String replyInsert(@ModelAttribute Criteria cri, @ModelAttribute ReplyVO reply, Principal principal) {

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		int noticeNo = reply.getNoticeNo();

		reply.setWriterId(principal.getName());

		// 로그인 시 댓글 입력
		if (reply.getWriterId() != null) {
			replyService.insertReply(reply);
		}

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/noticeList.do";
		}

		return "redirect:/board/noticeContent.do?page=" + page + "&amount=" + amount + "&type=" + type + "&keyword="
				+ keyword + "&noticeNo=" + noticeNo;
	}

	// 댓글 삭제
	@PostMapping("replyDelete.do")
	public String replyDelete(@ModelAttribute Criteria cri, @ModelAttribute ReplyVO reply, Principal principal) {

		// 댓글 작성자 검색
		String writerId = replyService.searchWriter(reply.getReplyNo());

		// 로그인 정보
		String loginId = principal.getName();

		// 관리자 계정 확인
		int check = qnaService.checkAdmin(loginId);

		// 댓글의 작성자와 일치하지 않고 관리자가 아닐 경우
		if (!writerId.equals(loginId) && check != 1) {
			return "redirect:/accessError3.do";
		}

		// 댓글 삭제
		replyService.deleteReply(reply.getReplyNo());

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		int noticeNo = reply.getNoticeNo();

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/noticeList.do";
		}

		return "redirect:/board/noticeContent.do?page=" + page + "&amount=" + amount + "&type=" + type + "&keyword="
				+ keyword + "&noticeNo=" + noticeNo;

	}

	// 댓글 수정 권한 체크
	@ResponseBody
	@PostMapping("/replyCheck.do")
	public String replyCheck(@RequestParam int replyNo, Principal principal) {

		String loginId = principal.getName();

		// 댓글 작성자 검색
		String writerId = replyService.searchWriter(replyNo);

		if (loginId.equals(writerId)) {
			return "success";
		} else {
			return "fail";
		}

	}

	// 댓글 수정
	@PostMapping("/replyModify.do")
	public String replyModfiy(@ModelAttribute Criteria cri, @ModelAttribute ReplyVO reply, Principal principal) {

		String loginId = principal.getName();

		// 댓글 작성자 검색
		String writerId = replyService.searchWriter(reply.getReplyNo());

		// 댓글의 작성자와 일치하지 않은 경우
		if (!writerId.equals(loginId)) {
			return "redirect:/accessError3.do";
		}

		reply.setWriterId(loginId);

		// 댓글수정
		replyService.modifyReply(reply);

		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		int noticeNo = reply.getNoticeNo();

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/noticeList.do";
		}

		return "redirect:/board/noticeContent.do?page=" + page + "&amount=" + amount + "&type=" + type + "&keyword="
				+ keyword + "&noticeNo=" + noticeNo;
	}

}
