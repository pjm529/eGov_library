package library.board.service;

import java.util.List;

import library.board.domain.EnquiryVO;
import library.common.page.Criteria;

public interface QnaService {

	// 문의 사항 리스트 출력
	public List<EnquiryVO> qnaBoardList(Criteria cri);

	// 문의 사항 게시글 수
	public int qnaTotal(Criteria cri);
}
