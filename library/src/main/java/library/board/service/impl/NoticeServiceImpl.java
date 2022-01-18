package library.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.board.dao.NoticeDAO;
import library.board.domain.NoticeVO;
import library.board.service.NoticeService;
import library.common.page.Criteria;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

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

}
