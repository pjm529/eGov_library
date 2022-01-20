package library.board.service.impl;

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

}
