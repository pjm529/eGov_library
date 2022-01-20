package library.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.board.dao.ReplyDAO;
import library.board.domain.ReplyVO;
import library.board.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;

	// 댓글 입력
	@Override
	public void insertReply(ReplyVO reply) {
		replyDAO.insertReply(reply);
	}

	// 댓글 목록
	@Override
	public List<ReplyVO> replyList(long noticeNo) {
		return replyDAO.replyList(noticeNo);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(int replyNo) {
		replyDAO.deleteReply(replyNo);
	}

}
