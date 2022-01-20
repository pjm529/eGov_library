package library.board.dao;

import library.board.domain.ReplyVO;

public interface ReplyDAO {
	
	// 댓글 입력
	public void insertReply(ReplyVO reply);

}
