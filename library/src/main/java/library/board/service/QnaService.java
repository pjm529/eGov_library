package library.board.service;

import java.util.List;

import library.board.domain.EnquiryVO;
import library.common.page.Criteria;

public interface QnaService {


	// 문의 사항 리스트 출력
	public List<EnquiryVO> qnaBoardList(Criteria cri);

	// 문의 사항 게시글 수
	public int qnaTotal(Criteria cri);

	// 게시글 본문
	public EnquiryVO enquiryContent(long enquiryNo);

	// 조회수 증가
	public void updateView(long enquiryNo);

	// 문의 사항 작성
	public void enquiryInsert(EnquiryVO enquiry);

	// 문의 사항 수정
	public void modifyEnquiry(EnquiryVO enquiry);

	// 문의 사항 삭제
	public void deleteEnquiry(long enquiryNo);
}
