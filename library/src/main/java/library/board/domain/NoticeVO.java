package library.board.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {

	// 공지사항 번호
	private Long noticeNo;

	// 공지사항 제목
	private String noticeTitle;

	// 공지사항 내용
	private String noticeContent;

	// 작성자 ID
	private String writerId;

	// 작성자 명
	private String writerName;

	// 공지사항 등록일
	private Timestamp noticeRegDate;

	// 공지사항 수정일
	private Timestamp noticeModifyDate;

	// 공지사항 조회수
	private int noticeViews;

	// 첨부파일 목록
	private List<NoticeAttachVO> noticeAttachList;

}
