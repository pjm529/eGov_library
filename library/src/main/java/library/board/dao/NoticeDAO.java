package library.board.dao;

import java.util.List;

import library.board.domain.NoticeVO;
import library.common.page.Criteria;

public interface NoticeDAO {

	// 공지사항 목록
	public List<NoticeVO> noticeList(Criteria cri);
	
	// 공지사항 게시글 수
	public int noticeTotal(Criteria cri);
}
