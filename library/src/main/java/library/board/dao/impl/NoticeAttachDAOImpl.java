package library.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.NoticeAttachDAO;
import library.board.domain.NoticeAttachVO;

@Repository
public class NoticeAttachDAOImpl extends EgovAbstractMapper implements NoticeAttachDAO {

	// 첨부파일 정보 입력
	@Override
	public void insertAttach(NoticeAttachVO attach) {
		insert("NoticeAttach.insertAttach", attach);
	}

	// 첨부파일 리스트
	@Override
	public List<NoticeAttachVO> noticeAttachList(long noticeNo) {
		return selectList("NoticeAttach.attachList", noticeNo);
	}

}
