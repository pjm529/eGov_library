package library.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.board.dao.NoticeAttachDAO;
import library.board.dao.NoticeDAO;
import library.board.domain.NoticeVO;
import library.board.service.NoticeService;
import library.common.page.Criteria;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private NoticeAttachDAO attachDAO;

	// 공지사항 목록
	@Override
	public List<NoticeVO> noticeList(Criteria cri) {
		return noticeDAO.noticeList(cri);
	}

	// 공지사항 게시글 수
	@Override
	public int noticeTotal(Criteria cri) {
		return noticeDAO.noticeTotal(cri);
	}

	// 공지사항 조회수 증가
	@Override
	public void noticeViewsCount(long noticeNo) {
		noticeDAO.noticeViewsCount(noticeNo);
	}

	// 공지사항 본문
	@Override
	public NoticeVO noticeContent(long noticeNo) {
		return noticeDAO.noticeContent(noticeNo);
	}

	@Override
	public List<NoticeVO> getPrevAndNextPost(long noticeNo) {
		return noticeDAO.getPrevAndNextPost(noticeNo);
	}

	// 공지사항 등록
	@Override
	public void insertNotice(NoticeVO notice) {
		noticeDAO.insertNotice(notice);

		if (notice.getNoticeAttachList() == null || notice.getNoticeAttachList().size() <= 0) {
			return;
		}

		notice.getNoticeAttachList().forEach(attach -> {
			attach.setNoticeNo(notice.getNoticeNo());

			// db입력
			attachDAO.insertAttach(attach);
		});
	}

	// 공지사항 수정
	@Override
	public void noticeModify(NoticeVO notice) {
		noticeDAO.noticeModify(notice);
	}

	// 공지사항 삭제
	@Override
	public void deleteNotice(long noticeNo) {
		// 공지사항 삭제
		noticeDAO.deleteNotice(noticeNo);

		// 게시글 번호 정렬
		noticeDAO.resetNo();
	}

}
