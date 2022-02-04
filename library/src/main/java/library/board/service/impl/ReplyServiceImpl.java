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
			reply.setDepth(0);
			reply.setOrderId(1);

			// 댓글 입력
			replyDAO.insertReply(reply);
			reply.setGroupId(reply.getReplyNo());

			// 댓글 그룹 설정
			replyDAO.updateGroup(reply);

		} else {

			// 부모 댓글 정보 검색
			ReplyVO parent = replyDAO.searchParent(reply.getParentNo());


			// 그룹 설정
			reply.setGroupId(parent.getGroupId());

			// 깊이 설정
			reply.setDepth(parent.getDepth() + 1);

			HashMap<String, Object> map = new HashMap<>();
			map.put("groupId", parent.getGroupId());
			
			// 부모의 마지막 자식 order 번호
			int orderId = order(parent);
			reply.setOrderId(orderId + 1);
			map.put("orderId", orderId);
			
			
//			// 부모 댓글의 자식이 없을 때 부모 다음 번호
//			if (order == null) {
//
//				// orderId 설정
//				reply.setOrderId(parent.getOrderId() + 1);
//				map.put("orderId", parent.getOrderId());
//
//			} else { 
//
//				ReplyVO parent2 = replyDAO.searchParent(reply.getParentNo());
//				
//				parent2.setOrderId(Integer.parseInt(order));
//				
//				int orderId = order(parent2);
//				reply.setOrderId(orderId + 1);
//				map.put("orderId", orderId);
//
//			}

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

	// 대댓글 입력
	@Override
	public void insertReply2(ReplyVO reply) {
		replyDAO.insertReply2(reply);
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
