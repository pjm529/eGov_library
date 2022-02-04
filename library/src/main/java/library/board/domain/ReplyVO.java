package library.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {

	// 댓글 번호
	private int replyNo;

	// 공지사항 번호
	private int noticeNo;

	// 댓글 내용
	private String replyContent;

	// 댓글 작성자 ID
	private String writerId;

	// 댓글 작성자 명
	private String writerName;

	// 댓글 작성 시간
	private Timestamp replyRegDate;

	// 댓글 수정 시간
	private Timestamp replyModifyDate;

	// 부모 댓글
	private int parentNo;

	// 깊이
	private int depth;

	// 순서
	private int orderId;

	// 그룹
	private int groupId;
	
	// 삭제 상태
	private int flag;

}
