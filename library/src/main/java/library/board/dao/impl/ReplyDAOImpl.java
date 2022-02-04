package library.board.dao.impl;

import java.util.HashMap;
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

	// 댓글 작성자 검색
	@Override
	public String searchWriter(int replyNo) {
		return selectOne("Reply.searchWriter", replyNo);
	}

	// 댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) {
		update("Reply.modifyReply", reply);
	}

	// 대댓글 입력
	@Override
	public void insertReply2(ReplyVO reply) {
		insert("Reply.insertReply2", reply);
	}

	// 그룹 설정
	@Override
	public void updateGroup(ReplyVO reply) {
		update("Reply.updateGroup", reply);
	}

	// 부모 댓글 정보 확인
	@Override
	public ReplyVO searchParent(int parentNo) {
		return selectOne("Reply.searchParent", parentNo);
	}

	// 부모 댓글 자식 순서 확인
	@Override
	public int searchOrder(int parentNo) {
		return selectOne("Reply.searchOrder", parentNo);
	}

	// 순서 정렬
	@Override
	public void updateOrder(HashMap<String, Object> map) {
		update("Reply.updateOrder", map);
	}

	@Override
	public int searchChild(ReplyVO reply) {
		return selectOne("Reply.searchChild", reply);
	}

}
