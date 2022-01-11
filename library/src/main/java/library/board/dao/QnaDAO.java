package library.board.dao;

import java.util.List;

import library.board.domain.EnquiryVO;
import library.common.page.Criteria;

public interface QnaDAO {

	// 관리자 권한 확인
	public int checkAdmin(String userId);
	
	// 문의 사항 리스트 출력
	public List<EnquiryVO> qnaBoardList(Criteria cri);
	
	// 문의 사항 게시글 수
	public int qnaTotal(Criteria cri);
	
	// 게시글 본문
	public EnquiryVO enquiryContent(long enquiryNo);

	// 조회수 증가
	public void updateView(long enquiryNo);
}
