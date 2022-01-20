package library.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.ReplyDAO;
import library.board.domain.ReplyVO;

@Repository
public class ReplyDAOImpl extends EgovAbstractMapper implements ReplyDAO {

	// 댓글 입력
	@Override
	public void insertReply(ReplyVO reply) {
		insert("Reply.insertReply", reply);
	}

	// 댓글 목록
	@Override
	public List<ReplyVO> replyList(long noticeNo) {
		return selectList("Reply.replyList", noticeNo);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(int replyNo) {
		delete("Reply.deleteReply", replyNo);
	}

}
