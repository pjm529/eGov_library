package library.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.QnaDAO;
import library.board.domain.EnquiryVO;
import library.common.page.Criteria;

@Repository
public class QnaDAOImpl extends EgovAbstractMapper implements QnaDAO {

	// 문의 사항 리스트 출력
	@Override
	public List<EnquiryVO> qnaBoardList(Criteria cri) {
		return selectList("Enquiry.qnaBoardList", cri);
	}

	// 문의 사항 게시글 수 
	@Override
	public int qnaTotal(Criteria cri) {
		return selectOne("Enquiry.qnaTotal", cri);
	}

}
