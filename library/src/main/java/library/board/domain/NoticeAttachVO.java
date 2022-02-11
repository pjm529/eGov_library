package library.board.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeAttachVO {

	// uuid
	private String uuid;

	// 업로드 경로
	private String uploadPath;

	// 파일명
	private String fileName;

	// 파일타입
	private boolean fileType;

	// 공지사항 번호
	private Long noticeNo;

}
