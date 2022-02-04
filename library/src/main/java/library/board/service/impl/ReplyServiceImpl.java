package library.board.service.impl;

import java.util.HashMap;
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
			
			// 깊이는 0
			reply.setDepth(0);
			
			// 순서는 1
			reply.setOrderId(1);

			// 댓글 입력
			replyDAO.insertReply(reply);

			// 부모 댓글 그룹 설정 (자신의 댓글 번호)
			replyDAO.updateGroup(reply.getReplyNo());

		} else {

			// 부모 댓글 정보 검색
			ReplyVO parent = replyDAO.searchParent(reply.getParentNo());

			// 그룹 설정(부모와 같은 그룹)
			reply.setGroupId(parent.getGroupId());

			// 깊이 설정(부모 깊이 + 1)
			reply.setDepth(parent.getDepth() + 1);
			
			// 부모의 마지막 자식 order 번호 찾기
			int orderId = order(parent);
			reply.setOrderId(orderId + 1);
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("groupId", parent.getGroupId());
			map.put("orderId", orderId);

			// 입력 되는 댓글의 순서 뒷 번호 정렬
			replyDAO.updateOrder(map);

			// 자식 댓글 입력
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

	// 최종 자식 댓글 찾기 위한 재귀 함수
	public int order(ReplyVO reply) {

		// 자식 댓글이 없을 경우 현재 OrderId 반환
		if (replyDAO.searchChild(reply) == 0) {
			return reply.getOrderId();
		} else {
			reply.setOrderId(replyDAO.searchChild(reply));
			return order(reply);
		}
	}
}
