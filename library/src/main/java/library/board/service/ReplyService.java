package library.board.service;

import java.util.List;

import library.board.domain.ReplyVO;

public interface ReplyService {

	// 댓글 입력
	public void insertReply(ReplyVO reply);

	// 댓글 목록
	public List<ReplyVO> replyList(long noticeNo);

	// 댓글 삭제
	public void deleteReply(int replyNo);
}
