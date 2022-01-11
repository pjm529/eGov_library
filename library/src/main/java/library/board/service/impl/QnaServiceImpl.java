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

	// 관리자 권한 확인
	@Override
	public int checkAdmin(String userId) {
		return qnaDAO.checkAdmin(userId);
	}

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

	// 게시글 본문
	@Override
	public EnquiryVO enquiryContent(long enquiryNo) {
		return qnaDAO.enquiryContent(enquiryNo);
	}

	// 조회수 증가
	@Override
	public void updateView(long enquiryNo) {
		qnaDAO.updateView(enquiryNo);
	}

	// 문의 사항 작성
	@Override
	public void enquiryInsert(EnquiryVO enquiry) {
		qnaDAO.enquiryInsert(enquiry);
	}

	// 문의 사항 수정
	@Override
	public void modifyEnquiry(EnquiryVO enquiry) {
		qnaDAO.modifyEnquiry(enquiry);
	}

}
