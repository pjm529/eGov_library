package library.board.service;

import java.util.List;

import library.board.domain.NoticeAttachVO;

public interface NoticeAttachService {

	// 첨부파일 리스트
	public List<NoticeAttachVO> noticeAttachList(long noticeNo);

}
