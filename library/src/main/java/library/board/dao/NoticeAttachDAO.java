package library.board.dao;

import java.util.List;

import library.board.domain.NoticeAttachVO;

public interface NoticeAttachDAO {

	// 첨부파일 정보 입력
	public void insertAttach(NoticeAttachVO attach);

	// 첨부파일 리스트
	public List<NoticeAttachVO> noticeAttachList(long noticeNo);
	
	// 첨부파일 전부 삭제
	public void deleteAll(long noticeNo);

}
