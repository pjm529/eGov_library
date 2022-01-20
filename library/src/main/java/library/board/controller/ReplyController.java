package library.board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import library.board.domain.ReplyVO;
import library.board.service.ReplyService;
import library.common.page.Criteria;

@Controller
@RequestMapping("/board")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;

	// 댓글 입력
	@PostMapping("/replyInsert.do")
	public String replyInsert(@ModelAttribute Criteria cri, @ModelAttribute ReplyVO reply, Principal principal) {
		
		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		int noticeNo = reply.getNoticeNo();
		
		reply.setWriterId(principal.getName());
		
		replyService.insertReply(reply);

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/noticeList.do";
		}

		return "redirect:/board/noticeContent.do?page=" + page + "&amount=" + amount + "&type=" + type + "&keyword="
				+ keyword + "&noticeNo=" + noticeNo;
	}

}
