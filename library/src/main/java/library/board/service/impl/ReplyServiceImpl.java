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

		// 부모 댓글일 경우
		if (reply.getParentNo() == 0) {
			reply.setDepth(0);
			reply.setOrderId(1);

			// 댓글 입력
			replyDAO.insertReply(reply);
			reply.setGroupId(reply.getReplyNo());

			// 댓글 그룹 설정
			replyDAO.updateGroup(reply);

		} else {
			replyDAO.insertReply(reply);
		}

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

	// 댓글 작성자 검색
	@Override
	public String searchWriter(int replyNo) {
		return replyDAO.searchWriter(replyNo);
	}

	// 댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) {
		replyDAO.modifyReply(reply);
	}

	// 대댓글 입력
	@Override
	public void insertReply2(ReplyVO reply) {
		replyDAO.insertReply2(reply);
	}

}
