package library.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.QnaDAO;
import library.board.domain.EnquiryVO;
import library.common.page.Criteria;

@Repository
public class QnaDAOImpl extends EgovAbstractMapper implements QnaDAO {

	// 관리자 권한 확인
	@Override
	public int checkAdmin(String userId) {
		return selectOne("Enquiry.checkAdmin", userId);
	}

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

	// 게시글 본문
	@Override
	public EnquiryVO enquiryContent(long enquiryNo) {
		return selectOne("Enquiry.enquiryContent", enquiryNo);
	}

	// 조회수 증가
	@Override
	public void updateView(long enquiryNo) {
		update("Enquiry.updateView", enquiryNo);
	}

	// 문의 사항 작성
	@Override
	public void enquiryInsert(EnquiryVO enquiry) {
		insert("Enquiry.enquiryInsert", enquiry);
	}

	// 문의 사항 수정
	@Override
	public void modifyEnquiry(EnquiryVO enquiry) {
		update("Enquiry.modifyEnquiry", enquiry);
	}

}
