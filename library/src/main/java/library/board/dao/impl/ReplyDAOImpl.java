package library.board.dao.impl;

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

}
