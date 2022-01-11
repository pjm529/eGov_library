package library.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.board.dao.QnaDAO;
import library.board.domain.EnquiryVO;
import library.board.service.QnaService;
import library.common.page.Criteria;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDAO;

	// 문의 사항 리스트 출력
	@Override
	public List<EnquiryVO> qnaBoardList(Criteria cri) {
		return qnaDAO.qnaBoardList(cri);
	}

	// 문의 사항 게시글 수
	@Override
	public int qnaTotal(Criteria cri) {
		return qnaDAO.qnaTotal(cri);
	}

}
