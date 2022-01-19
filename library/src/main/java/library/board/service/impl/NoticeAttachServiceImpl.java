package library.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.board.dao.NoticeAttachDAO;
import library.board.domain.NoticeAttachVO;
import library.board.service.NoticeAttachService;

@Service
public class NoticeAttachServiceImpl implements NoticeAttachService {

	@Autowired
	private NoticeAttachDAO attachDAO;
	
	// 첨부파일 리스트
	@Override
	public List<NoticeAttachVO> noticeAttachList(long noticeNo) {
		return attachDAO.noticeAttachList(noticeNo);
	}

}
