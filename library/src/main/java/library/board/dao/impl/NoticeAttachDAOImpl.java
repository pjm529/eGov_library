package library.board.dao.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.NoticeAttachDAO;
import library.board.domain.NoticeAttachVO;

@Repository
public class NoticeAttachDAOImpl extends EgovAbstractMapper implements NoticeAttachDAO {

	@Override
	public void insertAttach(NoticeAttachVO attach) {
		insert("NoticeAttach.insertAttach", attach);
	}

}
