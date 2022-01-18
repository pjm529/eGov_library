package library.board.dao;

import java.util.List;

import library.board.domain.NoticeVO;
import library.common.page.Criteria;

public interface NoticeDAO {

	// 공지사항 목록
	public List<NoticeVO> noticeList(Criteria cri);
	
	// 공지사항 게시글 수
	public int noticeTotal(Criteria cri);
	
	// 공지사항 조회수 증가
	public void noticeViewsCount(long noticeNo);
	
	// 공지사항 본문
	public NoticeVO noticeContent(long noticeNo);
	
	// 공지사항 이전글, 다음글
	public List<NoticeVO> getPrevAndNextPost(long noticeNo);
	
	// 공지사항 등록
	public void insertNotice(NoticeVO notice);
	
	// 공지사항 수정
	public void noticeModify(NoticeVO notice);
}
