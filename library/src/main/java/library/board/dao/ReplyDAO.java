package library.board.dao;

import java.util.HashMap;
import java.util.List;

import library.board.domain.ReplyVO;

public interface ReplyDAO {

	// 댓글 입력
	public void insertReply(ReplyVO reply);

	// 댓글 목록
	public List<ReplyVO> replyList(long noticeNo);

	// 댓글 삭제
	public void deleteReply(int replyNo);

	// 댓글 작성자 검색
	public String searchWriter(int replyNo);

	// 댓글 수정
	public void modifyReply(ReplyVO reply);

	// 부모 댓글 그룹 설정
	public void updateGroup(int replyNo);

	// 부모 댓글 정보 확인
	public ReplyVO searchParent(int parentNo);

	// 순서 정렬
	public void updateOrder(HashMap<String, Object> map);

	// 부모 댓글 자식 확인
	public int searchChild(ReplyVO reply);

}
