package library.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.NoticeDAO;
import library.board.domain.NoticeVO;
import library.common.page.Criteria;

@Repository
public class NoticeDAOImpl extends EgovAbstractMapper implements NoticeDAO {

	// 공지사항 목록
	@Override
	public List<NoticeVO> noticeList(Criteria cri) {
		return selectList("Notice.noticeList", cri);
	}

	// 공지사항 게시글 수
	@Override
	public int noticeTotal(Criteria cri) {
		return selectOne("Notice.noticeTotal", cri);
	}

	// 공지사항 조회수 증가
	@Override
	public void noticeViewsCount(long noticeNo) {
		update("Notice.noticeViewsCount", noticeNo);
	}

	// 공지사항 본문
	@Override
	public NoticeVO noticeContent(long noticeNo) {
		return selectOne("Notice.noticeContent", noticeNo);
	}

	// 공지사항 이전글, 다음글
	@Override
	public List<NoticeVO> getPrevAndNextPost(long noticeNo) {
		return selectList("Notice.getPrevAndNextPost", noticeNo);
	}

	// 공지사항 등록
	@Override
	public void insertNotice(NoticeVO notice) {
		insert("Notice.insertNotice", notice);
	}

}
